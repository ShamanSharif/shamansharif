# Stage 1: Build the Jekyll site
FROM ubuntu:latest as builder

RUN apt update
RUN apt install ruby-dev build-essential zlib1g-dev -y
RUN gem install jekyll bundler

WORKDIR /app

COPY . /app/

RUN bundle

RUN JEKYLL_ENV=production bundle exec jekyll b

# Stage 2: Serve the built site with Nginx
FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d/

COPY --from=builder /app/_site /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
