FROM loyaltyone/jenkins-slave:0.4

#=========
# SBT
#=========

ENV SBT_VERSION=0.13.15 \
    SBT_HOME=/usr/local/sbt
ENV PATH=${PATH}:${SBT_HOME}/bin

RUN curl -sL "http://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local

USER jenkins

RUN sbt sbt-version \
    && rm -rf project

USER root

#================
# MAVEN (3.3.9-3)
#================

ENV MAVEN_VERSION=3.3.9-3

RUN apt-get update && apt-get install -y maven=$MAVEN_VERSION

#================
# Node
#================

COPY node-setup node-setup
RUN chmod +x node-setup

USER jenkins
# Install more node versions using NVM (already installed) as well as packages
RUN ./node-setup && rm node-setup

USER root

#================
# Scala
#================

USER jenkins
# based off https://github.com/ysihaoy/docker-scala
# Copy everything (need project and build.sbt) to /home/jenkins/build
COPY . /home/jenkins/build/
RUN cd /home/jenkins/build && \
    (sbt "+compile") && \
    (sbt "+test:compile")

USER root
RUN rm -rf /home/jenkins/build
