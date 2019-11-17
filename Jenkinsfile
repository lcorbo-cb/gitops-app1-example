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
          kanikoBuild('lcorbocb/my-fourth-repo')
        }
      }
    }
    stage('Unit Test with dgoss') {
      steps {
        script {
          containerdUnitTest('lcorbocb/my-fourth-repo')
        }
      }
    }
  }
}
