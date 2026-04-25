pipeline {
    agent any
    environment {
        DOCKERHUB_CRED = credentials('dockerhub-creds')
    }
    stages {
        stage('Checkout') {
            steps { git branch: 'dev', url: 'https://github.com/sathishkumarnmca-source/devops-build.git' }
        }
        stage('Build') {
            steps { sh './build.sh' }
        }
        stage('Push to Dev Repo') {
            when { branch 'dev' }
            steps {
                sh 'docker login -u $DOCKERHUB_CRED_USR -p $DOCKERHUB_CRED_PSW'
                sh 'docker tag react-app:latest sathishdocker3011/dev:latest'
                sh 'docker push sathishdocker3011/dev:latest'
            }
        }
        stage('Push to Prod Repo') {
            when { branch 'master' }
            steps {
                sh 'docker login -u $DOCKERHUB_CRED_USR -p $DOCKERHUB_CRED_PSW'
                sh 'docker tag react-app:latest sathishdocker3011/prod:latest'
                sh 'docker push sathishdocker3011/prod:latest'
            }
        }
        stage('Deploy') {
            steps { sh './deploy.sh' }
        }
    }
}

