FROM tomcat:9.0.75
MAINTAINER ghanashyam
CMD ["catalina.sh", "run"]
COPY ./webapp.war /usr/local/tomcat/webapps
EXPOSE 8080
