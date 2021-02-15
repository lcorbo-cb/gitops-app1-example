library identifier: 'custom-lib@master', retriever: modernSCM(
  [$class: 'GitSCMSource',
   remote: 'https://github.com/lcorbo-cb/gitops-sharedliberary-example.git',
   credentialsId: 'lcorbo-cb-key'])

pipeline {
  agent none
  options {
    disableConcurrentBuilds()
  }
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
    stage('testtest') {
      agent {
        kubernetes {
          yaml """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: hadolint
    image: lcorbocb/hadolint:demo
    imagePullPolicy: Always
    command:
    - cat
    tty: true
    """
        }
      }
      steps {
        script {
          // checkout scm
          container('hadolint') {
            sh "ls -l"
            sh "hadolint `pwd`/Dockerfile"
          }
          // sh("printenv")
          // println "hold"
        }
      }
    }
  }
}
