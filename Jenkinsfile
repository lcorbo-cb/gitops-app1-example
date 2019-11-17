pipeline {
  agent {
    kubernetes {
      yamlFile 'examples/declarative_from_yaml_file/KubernetesPod.yaml'
    }
  }
  stages {
    stage('Run maven') {
      steps {
        container('maven') {
          sh 'mvn -version'
        }
        container('busybox') {
          sh '/bin/busybox'
        }
      }
    }
  }
}
