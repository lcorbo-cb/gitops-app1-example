library identifier: 'custom-lib@master', retriever: modernSCM(
  [$class: 'GitSCMSource',
   remote: 'https://github.com/lcorbo-cb/gitops-sharedliberary-example.git',
   credentialsId: 'lcorbo-cb-key'])

pipeline {
  agent none
  stages {
    stage('Build with Kaniko') {
      steps {
        script {
          kanikoBuild('lcorbocb/my-third-repo')
        }
      }
    }
  }
}
