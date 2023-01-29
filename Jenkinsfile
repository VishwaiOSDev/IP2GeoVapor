pipeline {
    agent {
        docker {
            image 'vapor/swift:latest'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'swift build'
            }
        }
        stage('Test') {
            steps {
                sh 'swift test'
            }
        }
    }
}
