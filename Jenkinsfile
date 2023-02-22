pipeline{
    agent any
    tools {
        dockerTool 'Docker'
    }
    stages {
         stage('Build') {
             steps {
                    sh 'make'
              }
             }
         stage('Push') {
             steps {
                    sh 'make tag-and-push'
              }
             }
        }
}
