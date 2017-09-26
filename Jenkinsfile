pipeline {
  agent any
  environment {
    BUILD_VERSION = '$(python3 -c \'from version import VERSION; print(VERSION,end="")\')'
  }
  stages {
    stage('Build') {
      steps {
        echo "buildling..."
        sh "docker build -t trstringer/jenkinstest:${env.BUILD_VERSION} ."
        sh "docker run -d -p 8000:8000 --rm --name jenkinstest${env.BUILD_VERSION} trstringer/jenkinstest:${env.BUILD_VERSION}"
      }
    }
    stage('Test') {
      steps {
        sh 'sleep 5'
        sh '. ./integration/web_response.sh'
      }
    }
    stage('Deliver') {
      when {
        expression {
          currentBuild.result == null || currentBuild.result == 'SUCCESS'
        }
      }
      steps {
        echo "pushing image to container registry..."
        sh "docker push trstringer/jenkinstest:${env.BUILD_VERSION}"
      }
    }
  }
  post {
    always {
      sh "docker stop jenkinstest${env.BUILD_VERSION}"
      sh "docker image prune -f"
    }
    failure {
      mail bcc: '', body: 'The build has failed. Look into it.', cc: '', from: '', replyTo: '', subject: 'Build failed', to: 'github@trstringer.com'
    }
  }
}
