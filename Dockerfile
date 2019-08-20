FROM tomcat:8
ADD http://35.165.105.174:8081/artifactory/docker/gameoflife.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
