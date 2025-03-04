pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'harishkoppineni/flask-app:latest'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git url: 'https://github.com/arjunkoppineni/docker-jenkins.git', branch: 'main'
                echo "Repository cloned successfully"
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker Image..."
                bat "docker build -t %DOCKER_IMAGE% ."
            }
        }

        stage('Push Docker Image') {
            steps {
                echo "Pushing Docker Image..."
                withDockerRegistry([credentialsId: 'docker-hub-cred', url: 'https://index.docker.io/v1/']) {
                    bat "docker push %DOCKER_IMAGE%"
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline executed successfully 🚀!"
        }
        failure {
            echo "Pipeline failed ❌"
        }
    }
}
