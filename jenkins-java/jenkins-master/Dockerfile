FROM jenkins:2.7.2-alpine

MAINTAINER Ashish Pandey "ashishapy@gmail.com"

# root user
USER root

# Install packages
RUN apk add --no-cache \
		ca-certificates \
		openssl \
		tar \
		py-pip

# Used to control Docker and Docker Compose versions installed
ARG DOCKER_ENGINE=1.12.0
ARG DOCKER_SHA256=3dd07f65ea4a7b4c8829f311ab0213bca9ac551b5b24706f3e79a97e22097f8b
ARG DOCKER_COMPOSE=1.8.0
ENV DOCKER_BUCKET get.docker.com

# Install Docker Engine
RUN set -x \
	&& curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-${DOCKER_ENGINE:-1.12.0}.tgz" -o docker.tgz \
	&& echo "${DOCKER_SHA256:-3dd07f65ea4a7b4c8829f311ab0213bca9ac551b5b24706f3e79a97e22097f8b} *docker.tgz" | sha256sum -c - \
	&& tar -xzvf docker.tgz \
	&& mv docker/* /usr/local/bin/ \
	&& rmdir docker \
	&& rm docker.tgz \
	&& docker -v

# Install Docker Compose
RUN pip install "docker-compose==${DOCKER_COMPOSE:-1.8.0}" \
	&& docker-compose -v

# Docker entrypoint script
COPY scripts/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Install Maven
ARG MAVEN_VERSION=3.3.9

RUN mkdir -p /usr/share/maven \
  && curl -fsSL http://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION:-3.3.9}/binaries/apache-maven-${MAVEN_VERSION:-3.3.9}-bin.tar.gz \
    | tar -xzC /usr/share/maven --strip-components=1 \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

# Create Jenkins user and log Folder
RUN mkdir /var/log/jenkins \
	&& mkdir /var/cache/jenkins \
	&& chown -R jenkins:jenkins /var/log/jenkins \
	&& chown -R jenkins:jenkins /var/cache/jenkins

# Change to jenkins user
USER jenkins

# Set default Jenkins options
ENV JAVA_OPTS="-Djava.util.logging.config.file=/var/jenkins_home/log.properties"
ENV JENKINS_OPTS="--logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war"

# Add Jenkins plugins
# COPY plugins.txt /usr/share/jenkins/plugins.txt
# RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

# Run docker and jenkins entrypoint scripts
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]