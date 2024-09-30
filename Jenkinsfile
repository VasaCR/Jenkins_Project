pipeline {
    agent any

    environment {
        GO_VERSION = "1.21.6"
        IMAGE_NAME = "vasachakradhar796/image"
        IMAGE_TAG = "latest"
        DOCKER_CREDENTIALS_ID = "81c0cd89-e4e2-4ee2-93c6-5e471ff3f1e7"
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull the latest code from your repository
                git 'https://github.com/VasaCR/Jenkins_Project.git'
            }
        }

        stage('Build') {
            steps {
                // Build the Go application using batch command for Windows
                bat 'go build -o gin-app.exe'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image using batch command for Windows
                    bat "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                // Login to Docker Hub using batch command for Windows
                withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    bat "echo %DOCKER_PASSWORD% | docker login -u %DOCKER_USERNAME% --password-stdin"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                // Push the Docker image to Docker Hub using batch command for Windows
                bat "docker push ${IMAGE_NAME}:${IMAGE_TAG}"
            }
        }
    }
}
