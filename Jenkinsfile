pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Deploy') {
            steps {
                    deploy adapters: [tomcat8(url: 'http://54.86.89.168:8080/', 
                              credentialsId: 'Tomcat User')], 
                     war: '**/*.war'
            }
        }
    }
}
