pipeline {
    when {
        branch 'dev'
    }
    agent any
    environment {
        DOCKER_REGISTRY = 'hscr.homeserv.shamansharif.com'
        DOCKER_IMAGE = "${DOCKER_REGISTRY}/blog"
    }
    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }
        stage('Push Docker Image') {
            steps {
                sh 'docker push $DOCKER_IMAGE'
            }
        }
    }
}
