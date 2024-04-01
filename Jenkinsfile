pipeline {
    agent any
    environment {
        registry = "905418215051.dkr.ecr.us-east-2.amazonaws.com/weather"
    }
   
    stages {
        stage('Cloning Git') {
            steps {
                 git changelog: false, credentialsId: 'Automation', poll: false, url: 'https://github.com/JDKurb/SpringWeather.git'
            }
        }
      stage ('Build') {
          steps {
            sh './gradlew build --refresh-dependencies'
            sh './gradlew clean build'           
            }
      }
    // Building Docker images
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry 
        }
      }
    }
   
    // Uploading Docker images into AWS ECR
    stage('Pushing to ECR') {
     steps{  
         script {
                sh 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin account_id.dkr.ecr.us-east-2.amazonaws.com'
                sh 'docker push 905418215051.dkr.ecr.us-east-2.amazonaws.com/weather:latest'
         }
        }
      }

       stage('K8S Deploy') {
        steps{   
            script {
                withKubeConfig([credentialsId: 'AWS', serverUrl: '']) {
                sh ('kubectl apply -f weather.yaml')
                }
            }
        }
       }
    }
}