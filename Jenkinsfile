pipeline {
    agent any

    stages {
        stage('Checkout source') {
            steps {
                git branch: 'master', url: 'https://github.com/Oiquaaa/flasky-ci-cd.git'
            }
        }

        stage('Build Docker image') {
            steps {
                sh 'docker build -t flasky-ci .'
            }
        }

        stage('Stop old container') {
            steps {
                sh '''
                docker stop flasky-ci || true
                docker rm flasky-ci || true
                '''
            }
        }

        stage('Run new container') {
            steps {
                sh 'docker run -d -p 5000:5000 --name flasky-ci flasky-ci'
            }
        }
    }
}

