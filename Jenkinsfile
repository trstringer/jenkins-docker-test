pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'buildling...'
        sh 'docker build -t jenkinstest:$(python3 -c \'from version import VERSION; print(VERSION,end="")\') .'
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
