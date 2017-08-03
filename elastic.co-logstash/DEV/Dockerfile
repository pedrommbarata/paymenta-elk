FROM docker.elastic.co/logstash/logstash:5.5.0

#Configurations and pipeline
RUN rm -f /usr/share/logstash/pipeline/logstash.conf \
RUN rm -f /usr/share/logstash/config/logstash.yml

COPY config/logstash.yml /usr/share/logstash/config/logstash.yml
COPY pipeline/ /usr/share/logstash/pipeline/

#Instal OpenSSL and configure certificate
RUN mkdir /usr/share/logstash/keys/
USER root
RUN yum -y install openssl
RUN openssl req -x509 -days 3650 -batch -nodes -newkey rsa:2048 \
    -keyout /usr/share/logstash/keys/logstash.key \
    -out /usr/share/logstash/keys/logstash.crt

#Install needed logstash plugins
RUN mkdir /usr/share/logstash/plugins/
COPY plugins/ /usr/share/logstash/plugins/
RUN opt/logstash/bin/logstash-plugin install file:///usr/share/logstash/plugins/logstash-offline-plugins-5.5.0.zip

USER logstash
COPY certificate/TrustExternalCARoot.crt /usr/share/logstash/keys/TrustExternalCARoot.crt