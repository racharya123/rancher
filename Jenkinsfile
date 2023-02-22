pipeline{
    agent any
    tools {
        dockerTool 'Docker'
    }
    stages {
         stage('Push') {
             steps {
                    sh 'make tag-and-push'
              }
             }
        }
}
