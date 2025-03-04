pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'harishkoppineni/flask-app:latest'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git url: 'https://github.com/arjunkoppineni/docker-jenkins.git', branch: 'main'
                echo "✅ Repository Cloned Successfully"
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "🔨 Building Docker Image..."
                bat "docker build -t %DOCKER_IMAGE% ."
            }
        }

        stage('Push Docker Image') {
            steps {
                echo "🚀 Pushing Docker Image..."
                script {
                    withDockerRegistry([credentialsId: 'docker-hub-cred', url: '']) {
                        bat "docker login -u %DOCKER_USER% -p %DOCKER_PASS%"
                        bat "docker push %DOCKER_IMAGE%"
                    }
                }
            }
        }
    }

    post {
        success {
            echo "🎯 Pipeline Executed Successfully!"
        }
        failure {
            echo "❌ Pipeline Failed!"
        }
    }
}
