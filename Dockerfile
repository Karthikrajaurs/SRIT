FROM tomcat:9.0

COPY SRIT.war /usr/local/tomcat/webapps/

EXPOSE 8080
