library identifier: 'custom-lib@master', retriever: modernSCM(
  [$class: 'GitSCMSource',
   remote: 'git@github.com/lcorbo-cb:gitops-sharedliberary-example.git',
   credentialsId: 'lcorbo-cb-key'])

pipeline {
  agent {
    kubernetes {
      defaultContainer 'kaniko'
      yamlFile 'KubernetesPod.yaml'
    }
  }
  stages {
    stage('Shared Library') {
      steps {
        script {
          kaniko-build()
        }
      }
    }
    stage('Build with Kaniko') {
      steps {
        sh '/kaniko/executor -f `pwd`/Dockerfile -c `pwd` --skip-tls-verify --cache=true --destination=lcorbocb/my-second-repo'
      }
    }
  }
}
