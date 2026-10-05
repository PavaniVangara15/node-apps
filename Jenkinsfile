pipeline {
    agent any

    environment {
        IMAGE_NAME = "node-demo-app"
        IMAGE_TAG  = "latest"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }

        stage('Test') {
            steps {
                bat 'npm test'
            }
        }

        stage('Docker Build') {
            steps {
                bat "\"C:\\Users\\PavaniVangara\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe\"  build -t ${IMAGE_NAME}:${IMAGE_TAG} . "
            }
        }

        stage('Deploy') {
            steps {
                bat " docker rm -f ${IMAGE_NAME} || true "
                bat "  docker run -d --name ${IMAGE_NAME} -p 3000:3000 ${IMAGE_NAME}:${IMAGE_TAG} "
            }
        }
    }

    post {
        success {
            echo "Node.js CI/CD pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed. Check logs."
        }
    }
}