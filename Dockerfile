FROM tomcat:8
RUN apt-get update && apt-get install iputils-ping -y
EXPOSE 8080
CMD ["catalina.sh", "run"]
