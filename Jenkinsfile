pipeline {
    agent any

    stages {
        stage('Pruebas') {
            steps {
                sh 'python3 -m venv venv'
                sh './venv/bin/pip install -r requirements.txt'
                sh './venv/bin/python -m unittest test_puntaje.py'
            }
        }
    }
    post {
        failure {
            echo '❌ Las pruebas fallaron.'
        }
        success {
            echo '✅ Todo salió bien.'
        }
    }
}
