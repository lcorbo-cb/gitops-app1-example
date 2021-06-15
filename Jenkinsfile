pipeline {
  agent {
    kubernetes {
      yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    some-label: some-label-value
spec:
  containers:
  - name: maven
    image: maven:alpine
    command:
    - cat
    tty: true
  - name: busybox
    image: busybox
    command:
    - cat
    tty: true
"""
    }
  }
  triggers {
    eventTrigger jmespathQuery("event=='hello'" )
  }

  stages {
    stage('Run maven') {
      steps {
   //     echo "buildtag:" + currentBuild.getBuildCauses()[0].event.buildTag.toString()
   //     echo "jenkinsUrl:" + currentBuild.getBuildCauses()[0].event.source.buildInfo.jenkinsUrl.toString()
   //     echo "job:" + currentBuild.getBuildCauses()[0].event.source.buildInfo.job.toString()
        container('maven') {
          sh 'mvn -version'
          sh 'echo "I am running on an agent!"'
        }
      }
    }
  }
  post {
      always {
        container('busybox') {
          sh 'echo "I will always say Hello again!"'
        }
      }
      failure {
        container('busybox') {
          sh 'echo "I failed!"'
        }
      }
      success {
        container('busybox') {
          sh 'echo "I completed!"'
        }
      }
      cleanup {
        container('busybox') {
          sh 'echo "I am going to clean up these files."'
        }
      }
  }
}
