pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'buildling...'
        sh 'docker build -t jenkinstest:$(python3 -c \'from version import VERSION; print(VERSION,end="")\') .'
        sh 'docker run -d -p 8000:8000 --rm --name jenkinstest$(python3 -c \'from version import VERSION; print(VERSION,end="")\') jenkinstest:$(python3 -c \'from version import VERSION; print(VERSION,end="")\')'
      }
    }
    stage('Test') {
      steps {
        sh 'curl localhost:8001'
      }
    }
    stage('Cleanup') {
      steps {
        sh 'docker stop jenkinstest$(python3 -c \'from version import VERSION; print(VERSION,end="")\')'
        sh 'docker image prune'
      }
    }
  }
  post {
    failure {
      mail bcc: '', body: 'The build has failed. Look into it.', cc: '', from: '', replyTo: '', subject: 'Build failed', to: 'github@trstringer.com'
    }
  }
}
