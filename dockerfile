FROM centos:7
MAINTAINER name
RUN apt-get -y update
RUN update-java-alternatives -s java-8-oracle
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> ~/.bashrc
CMD [ "java" "-jar" *.war"]
