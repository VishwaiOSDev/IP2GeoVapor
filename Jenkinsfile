pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build . --tag ip2geo-vapor'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker start ip2geo-vapor'
            }
        }
    }
}
