pipeline {
  agent any
  environment {
    DOCKER_REPO = "dab8106/javaapp08042023"
    DOCKER_TAG = "latest"
  }
  stages {
    stage('Build and Push Docker Image') {
      steps {
        // Checkout your code from your Git repository
       //  checkout([$class: 'GitSCM', branches: [[name: '*/your-branch-name']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'your-credentials-id', url: 'your-git-repo-url']]])

        // Build the Docker image
        sh "docker build -t ${DOCKER_REPO}:${DOCKER_TAG} ."

        // Push the Docker image to the Docker registry
        withCredentials([usernamePassword(credentialsId: 'docker-cred', usernameVariable: 'DOCKER_REGISTRY_USERNAME', passwordVariable: 'DOCKER_REGISTRY_PASSWORD')]) {
          sh "docker login -u ${DOCKER_REGISTRY_USERNAME} -p ${DOCKER_REGISTRY_PASSWORD}"
          sh "docker push ${DOCKER_REPO}:${DOCKER_TAG}"
        }
      }
    }
  }
}
