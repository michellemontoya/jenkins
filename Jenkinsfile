pipeline {
    agent {
        docker {
            image 'python:3.11-slim' // Usa una imagen ligera con Python
            args '-u root' // permisos de usuario si necesitas instalar cosas
        }
    }

    stages {
        stage('Instalar dependencias') {
            steps {
                sh '''
                    pip install --upgrade pip
                    if [ -f requirements.txt ]; then
                        pip install -r requirements.txt
                    else
                        echo "No hay requirements.txt, instalando pytest manualmente"
                        pip install pytest
                    fi
                '''
            }
        }

        stage('Ejecutar pruebas') {
            steps {
                sh '''
                    pytest test_puntaje.py > resultado_tests.txt
                    cat resultado_tests.txt
                '''
            }
        }

        stage('Finalizar') {
            steps {
                echo '✅ Pipeline completado con éxito.'
            }
        }
    }

    post {
        failure {
            echo '❌ Las pruebas fallaron.'
        }
        success {
            echo '🎉 Todas las pruebas pasaron correctamente.'
        }
    }
}
