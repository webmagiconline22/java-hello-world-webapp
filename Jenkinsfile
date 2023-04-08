pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        
        stage('Unit tests and code coverage') {
            steps {
                sh 'mvn jacoco:prepare-agent test jacoco:report'
                publishHTML(target: [
                    allowMissing: false,
                    alwaysLinkToLastBuild: false,
                    keepAll: true,
                    reportDir: 'target/site/jacoco',
                    reportFiles: 'index.html',
                    reportName: 'Code Coverage Report'
                ])
            }
        }
        
        stage('Deploy to Tomcat') {
            environment {
                TOMCAT_URL = 'http://localhost:8080'
            }
            steps {
                sh 'mvn tomcat7:deploy -Dtomcat.url=${TOMCAT_URL} -Dtomcat.username=<username> -Dtomcat.password=<password>'
            }
        }
        
        stage('SonarQube analysis') {
            steps {
                withSonarQubeEnv('SonarQubeServer') {
                    sh 'mvn sonar:sonar'
                }
            }
        }
    }
}
