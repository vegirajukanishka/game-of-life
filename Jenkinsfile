pipeline {
    agent any
    stages {   
        stage('Cloning Git') {
            steps {
            node ('MAVEN') {
                git 'https://github.com/asquarezone/game-of-life.git'
                sh label:'',script:''' mvn clean package '''
                archive 'gameoflife-web/target/gameoflife.war'
                junit 'gameoflife-web/target/surefire-reports/*.xml'
                sh label:'',script: 'sudo docker build -t gol.2 .'
                sh label:'',script: 'sudo docker run -d -p 8074:8080 --name kan913 gol.2'
                sh label: '',script: 'sudo docker login --username kanishkaraju --password kanishka@13'
                sh label: '',script: 'sudo docker tag gol.2 kanishkaraju/raju:gol.2'
                sh label: '',script: 'sudo docker push kanishkaraju/raju:gol.2'
            }
        }     
        }
    }
}
