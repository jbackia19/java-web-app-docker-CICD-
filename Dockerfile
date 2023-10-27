FROM tomcat:8.0.20-jre8
# Dummy text to test 
FROM ubuntu:latest

RUN \
# Update
apt-get update -y && \
# Install Java
apt-get install default-jre -y
EXPOSE 8080
COPY target/java-web-app*.war /usr/local/tomcat/webapps/java-web-app.war
