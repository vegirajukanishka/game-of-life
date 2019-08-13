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
                sh label:'',script: 'sudo docker run -d -p 8062:8080 --name kansk kani:2.0'
                sh label: '',script: 'sudo docker login --username kanishkaraju --password kanishka@13'
                sh label: '',script: 'sudo docker tag kani:2.0 kanishkaraju/raju'
                sh label: '',script: 'sudo docker push kanishkaraju/raju:kani1'
            }
        }     
        }
    }
}
