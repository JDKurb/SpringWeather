node {
  def image
    stage ('checkout') {
                git changelog: false, credentialsId: 'Automation', poll: false, url: 'https://github.com/JDKurb/SpringWeather.git'
        }
   
     stage ('Build') {
            sh '''
                ./gradlew build --refresh-dependencies
                ./gradlew clean build
                '''  
        }
       
    stage ('Docker Build') {
            docker.build('weather')
        }

    stage ('Docker push') {
        docker.withRegistry('https://905418215051.dkr.ecr.us-east-2.amazonaws.com', 'ecr:us-east-2:weather') {
        docker.image('weather').push('latest')
        }
    }
  
 stage ('K8S Deploy') {
            sh 'kubectl apply -f weather-app.yaml'
      } 
}