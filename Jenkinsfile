pipeline {
    agent {
        docker {
            image 'python:3.8-slim'
            args '-p 5000:5000'
        }
    }

    stages {

        stage('Install dependencies') {
            steps {
                sh '''
                pip install --upgrade pip
                pip install -r requirements-ci.txt
                '''
            }
        }

        stage('Run Flask app (test run)') {
            steps {
                sh '''
                export FLASK_APP=flasky.py
                flask run --host=0.0.0.0 --port=5000 &
                sleep 5
                '''
            }
        }

        stage('Health check') {
            steps {
                sh '''
                apt-get update && apt-get install -y curl
                curl -I http://localhost:5000 || exit 1
                '''
            }
        }
    }
}
