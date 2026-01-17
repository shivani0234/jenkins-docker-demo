pipeline {
    agent any

    environment {
        IMAGE_NAME = "shivani121/apache-custom"
        IMAGE_TAG = "latest"
        DOCKER_CREDS = "dockerfile__cred"  // your Jenkins credential ID
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Image') {
            steps {
                sh "docker build -t \$IMAGE_NAME:\$IMAGE_TAG ."
            }
        }

        stage('Login DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: DOCKER_CREDS,
                  usernameVariable: 'DOCKER_USER',
                  passwordVariable: 'DOCKER_PASS')]) {
                    sh "echo \$DOCKER_PASS | docker login -u \$DOCKER_USER --password-stdin"
                }
            }
        }

        stage('Push Image') {
            steps {
                sh "docker push \$IMAGE_NAME:\$IMAGE_TAG"
            }
        }
    }
}
