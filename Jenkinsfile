library identifier: 'custom-lib@master', retriever: modernSCM(
  [$class: 'GitSCMSource',
   remote: 'https://github.com/lcorbo-cb/gitops-sharedliberary-example.git',
   credentialsId: 'lcorbo-cb-key'])

String TAG = "v1.17.2." + BUILD_ID

pipeline {
  agent none
  options {
    disableConcurrentBuilds()
    timestamps()
  }
  triggers {
    eventTrigger jmespathQuery("event=='hello'")
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
          kanikoBuild("lcorbocb/hadolint:${TAG}")
        }
      }
    }
    stage('Unit Test Image') {
      agent {
        kubernetes {
          yaml """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: hadolint
    image: lcorbocb/hadolint:${TAG}
    imagePullPolicy: Always
    command:
    - cat
    tty: true
    """
        }
      }
      steps {
        script {
          container('hadolint') {
            sh "printenv"
            sh "hadolint `pwd`/Dockerfile"
          }
          publishEvent jsonEvent("""{"eventName":"newbuild","buildTag":"${TAG}"}""")
          // sh("printenv")
          // println "hold"
        }
      }
    }
  }
}
