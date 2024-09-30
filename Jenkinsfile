pipeline {
    agent any

    environment {
        GO_VERSION = "1.21.6"
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

        stage('Test') {
            steps {
                // Run tests (if any)
                sh 'go test ./...'
            }
        }

        stage('Run Application') {
            steps {
                // Run the Go application (optional for testing)
                sh './gin-app &'  
            }
        }
    }

    post {
        always {
            // Clean up after build
            sh 'killall gin-app || true'
            cleanWs()
        }
    }
}
