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
        }
}
