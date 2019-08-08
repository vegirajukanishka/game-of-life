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
                sh label:'',script: 'sudo docker build -t kani:2.0 .'
                sh label:'',script: 'sudo docker run -d -p 8084:8080 --name kanishka13 kani:2.0'
                sh label: '', script: '''docker tag kani:2.0 kanishkaraju/raju'''
                sh label: '', script: '''docker push kanishkaraju/kani:2.0'''
            }
        }     
        }
    }
}
