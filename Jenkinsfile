pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'buildling...'
        sh 'docker build -t something:1.0 .'
      }
    }
    stage('Test') {
      steps {
        echo 'Testing'
      }
    }
    stage('Another') {
      steps {
        echo 'Another test'
      }
    }
  }
}
