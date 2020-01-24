### LINUX IMAGE
FROM ubuntu:bionic

### 2. Get Java via the package manager
RUN apt-get -y update \
&& apt-get -y upgrade \
&& apt-get install -y --no-install-recommends apt-utils \
&& apt-get install -y curl \
&& apt-get install -y openjdk-8-jdk \

### 2.5 Install JDBC driver for Liquibase to run
&& apt-get install -y libmysql-java

### 3. Get Python, PIP
RUN apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip \
&& apt-get clean

COPY . /liquibase-poc

RUN mkdir package/
RUN tar -xzf liquibase-poc/package/liquibase-3.8.5.tar.gz --directory package

ENV PATH "$PATH:/package"
ENV CLASSPATH "$CLASSPATH:/usr/share/java/mysql.jar"

CMD python liquibase-poc/app.py

