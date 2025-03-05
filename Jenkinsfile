pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'karthik449/flask-app:latest'
    }

    stages {
        stage('Clone Repo') {
            steps {
                echo "📌 Cloning Repo..."
                git url: 'https://github.com/karthikeya964/docker-jenkins.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "🔨 Building Docker Image..."
                sh "docker build -t $DOCKER_IMAGE ."
            }
        }

        stage('Push Docker Image') {
            steps {
                echo "🚀 Pushing Docker Image..."
                withDockerRegistry([credentialsId: 'docke-hub-cred', url: 'https://index.docker.io/v1/']) {
                    sh "docker push $DOCKER_IMAGE"
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
