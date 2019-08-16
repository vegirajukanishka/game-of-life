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
                sh label: '', script: '''curl -v -u admin:password -T gameoflife-web/target/gameoflife.war -X PUT http://54.214.53.129:8081/artifactory/docker/'''
                sh label:'',script: 'sudo docker build -t gol.4 . '
                sh label:'',script: 'sudo docker run -d -p 8077:8080 --name kan131 gol.4'
                sh label: '',script: 'sudo docker login --username kanishkaraju --password kanishka@13'
                sh label: '',script: 'sudo docker tag gol.4 kanishkaraju/raju:gol.4'
                sh label: '',script: 'sudo docker push kanishkaraju/raju:gol.4'
            }
        }     
        }
    }
}
