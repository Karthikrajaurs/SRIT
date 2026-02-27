FROM tomcat:9.0

COPY LoginProject.war /usr/local/tomcat/webapps/

EXPOSE 8080
