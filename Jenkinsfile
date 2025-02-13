pipeline {
    agent any

    environment {
        DOCKERHUB_USER = "your-dockerhub-username"
        IMAGE_NAME = "your-dockerhub-username/nginx-jenkins"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/your-username/nginx-docker-pipeline.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh "docker build -t $IMAGE_NAME ."
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub-password', variable: 'DOCKERHUB_PASS')]) {
                    sh "echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin"
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh "docker push $IMAGE_NAME"
            }
        }

        stage('Clean Up') {
            steps {
                sh "docker rmi $IMAGE_NAME"
            }
        }
    }
}
