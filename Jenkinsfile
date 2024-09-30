pipeline {
    agent any

    environment {
        GO_VERSION = "1.21.6"
        IMAGE_NAME = "vasachakradhar796/image" // Change this to your Docker Hub username and desired image name
        DOCKER_CREDENTIALS_ID = "81c0cd89-e4e2-4ee2-93c6-5e471ff3f1e7" // Jenkins credentials ID for Docker Hub
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull the latest code from your repository
                git 'https://github.com/VasaCR/Jenkins_Project.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Ensure Go modules are used
                sh 'go mod tidy'
            }
        }

        stage('Build') {
            steps {
                // Build the Go application
                sh 'go build -o gin-app'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                // Login to Docker Hub
                withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh "echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                // Push the Docker image to Docker Hub
                sh "docker push ${IMAGE_NAME}"
            }
        }
    }
}
