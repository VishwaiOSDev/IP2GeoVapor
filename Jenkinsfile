pipeline {
    agent any
    stages {
        
        stage('Check Swift Version') {
            steps {
                sh 'swift --version'
            }    
        }
       
        stage('Build Package') {
            steps {
                sh 'swift build'
            }    
        }
    
        stage('Run Tests') {
            steps {
                sh 'swift test'
            }
        }
    }
}
