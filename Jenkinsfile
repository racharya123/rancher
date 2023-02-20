pipeline{
    agent any
    tools {
        dockerTool 'Docker'
    }
    environment{
    DOCKER_CERT_PATH = credentials('53c9104a-fb12-4768-aa89-8479d05b87fe ')
    }
    stages {
        stage('Build') {
            steps {
                sh 'make'
            }
            }
        }
}
