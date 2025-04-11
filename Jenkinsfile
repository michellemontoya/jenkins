pipeline {
    agent any

    stages {
        stage('Instalar dependencias') {
            steps {
                sh 'python3 -m venv venv'
                sh './venv/bin/pip install --upgrade pip'
                sh './venv/bin/pip install -r requirements.txt'
            }
        }

        stage('Ejecutar pruebas') {
            steps {
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
