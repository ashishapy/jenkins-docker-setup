FROM jenkins:2.19.4-alpine

MAINTAINER Ashish Pandey "ashishapy@gmail.com"

# Create Jenkins Log Folder
USER root
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
USER jenkins

# Set default options
ENV JAVA_OPTS="-Djava.util.logging.config.file=/var/jenkins_home/log.properties"
ENV JENKINS_OPTS="--logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war"
