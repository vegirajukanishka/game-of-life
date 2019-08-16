FROM tomcat:8
ADD http://54.214.53.129:8081/artifactory/docker/gameoflife.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
