library identifier: 'custom-lib@master', retriever: modernSCM(
  [$class: 'GitSCMSource',
   remote: 'https://github.com/lcorbo-cb/gitops-sharedliberary-example.git',
   credentialsId: 'lcorbo-cb-key'])

pipeline {
  agent none
  stages {
    stage('Lint Dockerfile') {
      steps {
        script {
          containerdLint()
        }
      }
    }
    stage('Build with Kaniko') {
      steps {
        script {
          kanikoBuild('lcorbocb/hadolint:demo')
        }
      }
    }
    stage('Unit Tests') {
      steps {
        script {
          containerdUnitTest('hadolint')
        }
      }
    }
  }
  post {
    success {
      // notify users when the Pipeline Succeeds
      publishEvent jsonEvent('{"eventName":"helloWorld"}'), verbose: true
    }
  }
}
