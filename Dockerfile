FROM apereo/cas:v4.2.2

MAINTAINER Sergio Silva

COPY etc/cas.properties /etc/cas/cas.properties
COPY etc/log4j2.xml /etc/cas/log4j2.xml

COPY etc/thekeystore /etc/cas/jetty/thekeystore

COPY etc/*.json /cas-overlay/src/main/resources/services/

CMD ["/cas-overlay/bin/run-jetty.sh"]