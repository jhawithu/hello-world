# Pull base image 
FROM tomcat:9.0.74
COPY ./webapp.war /usr/local/tomcat/webapps
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
