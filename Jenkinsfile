pipeline {
    agent any

    environment {
        IMAGE_NAME = "node-demo-app"
        IMAGE_TAG  = "latest"
        DOCKER = "C:\\Users\\PavaniVangara\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe"
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
                // bat "\"C:\\Users\\PavaniVangara\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe\"  build -t ${IMAGE_NAME}:${IMAGE_TAG} . "
                 bat '"%DOCKER%" build -t %IMAGE_NAME%:%IMAGE_TAG% .'
            }
        }

        // stage('Deploy') {
        //     steps {
        //         bat " docker rm -f ${IMAGE_NAME} || true "
        //         bat "  docker run -d --name ${IMAGE_NAME} -p 3000:3000 ${IMAGE_NAME}:${IMAGE_TAG} "
        //     }
        // }
        stage('Deploy') {
            steps {
                bat """
                "%DOCKER%" rm -f node-demo-app || exit /b 0
                "%DOCKER%" run -d -p 3000:3000 --name node-demo-app %IMAGE_NAME%:%IMAGE_TAG%
                """
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