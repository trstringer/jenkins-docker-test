pipeline {
  agent any
  stages {
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
  environment {
    TESTENV = 'someval'
  }
}