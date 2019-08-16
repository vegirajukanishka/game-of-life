FROM tomcat:8
RUN apt-get update && apt-get install iputils-ping
COPY gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
