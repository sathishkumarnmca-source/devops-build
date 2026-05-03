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
                        sh 'docker tag reactbuild sathishdocker3011/dev:latest'
                        sh 'docker push sathishdocker3011/dev:latest'
                    } else if (env.BRANCH_NAME == 'main') {
                        sh 'docker tag reactbuild sathishdocker3011/prod:latest'
                        sh 'docker push sathishdocker3011/prod:latest'
                    }
                }
            }
        }
        stage('Deploy to EC2') {
            steps { sh './deploy.sh' }
        }
    }
}

