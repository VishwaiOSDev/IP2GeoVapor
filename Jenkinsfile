pipeline {
    agent any
    stages {
        stage('Clean cache') {
            steps {
                sh 'docker system prune -af'
            }
        }
        stage('Checkout latest code') {
            steps {
                checkout scm
            }
        }
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
