pipeline {
    agent any
    
    environment{
        DOCKER_IMAGE= 'harishkoppineni/flask-app:latest'
    }
stages{
    stage('clone Repo'){
        steps{
            git url:'', branch:'main'
        }
    }
    stage('Build Docker Image'){
        steps{
            sh 'docker build -t $DOCKER_IMAGE .'
        }
    }
    
    stage('Push docker image'){
        steps{
            withDockerRegistry([credentialsId:'docker-hub-cred',url: 'https://index.docker.io/v1/']){
                sh 'docker push $DOCKER_IMAGE'
            }
        }
    }

}

}