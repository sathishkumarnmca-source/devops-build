pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps { git branch: 'dev', url: ' https://github.com/sathishkumarnmca-source/devops-build.git ' }
        }
        stage('Build Docker Image') {
            steps { sh './build.sh' }
        }
        stage('Push to DockerHub') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        sh 'docker tag react-app:latest <dockerhub-username>/dev:latest'
                        sh 'docker push <dockerhub-username>/dev:latest'
                    } else if (env.BRANCH_NAME == 'master') {
                        sh 'docker tag react-app:latest <dockerhub-username>/prod:latest'
                        sh 'docker push <dockerhub-username>/prod:latest'
                    }
                }
            }
        }
        stage('Deploy to EC2') {
            steps { sh './deploy.sh' }
        }
    }
}

