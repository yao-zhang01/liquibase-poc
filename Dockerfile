### LINUX IMAGE
FROM ubuntu:bionic

### 1. Get Java via the package manager
RUN apt-get -y update \
&& apt-get -y upgrade \
&& apt-get install -y --no-install-recommends apt-utils \
&& apt-get install -y curl \
&& apt-get install -y openjdk-8-jdk

### 2. Get Python, PIP
RUN apt-get install -y python3-pip python3-dev \
&& cd /usr/local/bin \
&& ln -s /usr/bin/python3 python \
&& pip3 install --upgrade pip \
&& apt-get clean

COPY . /liquibase-poc

RUN mkdir package/
### 3. Install JDBC driver and unpack liquibase
RUN dpkg -i liquibase-poc/package/mysql-connector-java_8.0.19-1ubuntu19.10_all.deb
RUN tar -xzf liquibase-poc/package/liquibase-3.8.5.tar.gz --directory package

ENV PATH "$PATH:/package"
ENV CLASSPATH "$CLASSPATH:/usr/share/java/mysql-connector-java-8.0.19.jar"

CMD python liquibase-poc/app.py

