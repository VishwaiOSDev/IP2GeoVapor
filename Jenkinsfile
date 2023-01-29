pipeline {
    agent {
        docker {
            image 'vapor/swift:5.6.0'
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
