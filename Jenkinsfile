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
  }/*
  post {
    failure {
      // notify users when the Pipeline fails
      mail to: 'lcorbo@cloudbees.com',
          subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
          body: "Something is wrong with ${env.BUILD_URL}"
    }
    success {
      // notify users when the Pipeline Succeeds
      mail to: 'lcorbo@cloudbees.com',
          subject: "Successful Pipeline: ${currentBuild.fullDisplayName}",
          body: "${env.BUILD_URL} Completed"
    }
  }*/
}
