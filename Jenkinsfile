pipeline {
    agent {
        docker {
            image 'vapor/swift:5.3'
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
