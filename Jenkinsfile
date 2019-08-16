pipeline {
    agent any
    stages {   
        stage('Cloning Git') {
            steps {
            node ('maven') {
                git 'https://github.com/asquarezone/game-of-life.git'
                sh label:'',script:''' mvn clean package '''
                archive 'gameoflife-web/target/gameoflife.war'
                junit 'gameoflife-web/target/surefire-reports/*.xml'
                sh label:'',script: 'sudo docker build -t gol.3 /game-of-life/Dockerfile '
                sh label:'',script: 'sudo docker run -d -p 8076:8080 --name kan1313 gol.3'
                sh label: '',script: 'sudo docker login --username kanishkaraju --password kanishka@13'
                sh label: '',script: 'sudo docker tag gol.3 kanishkaraju/raju:gol.3'
                sh label: '',script: 'sudo docker push kanishkaraju/raju:gol.3'
            }
        }     
        }
    }
}
