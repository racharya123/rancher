pipeline{
    agent any
    tools {
        dockerTool 'Docker'
    }
    stages {
        stage('Build') {
            steps {
                sh 'make list-gomod-updates'
                sh 'make'
            }
            }
        }
}
