FROM jetty:9.3.12
MAINTAINER ylli@thoughtworks.com

EXPOSE 8443
COPY etc/cas.properties /etc/cas/cas.properties
COPY etc/log4j2.xml /etc/cas/log4j2.xml
COPY etc/thekeystore /var/lib/jetty/etc/keystore
COPY etc/jetty/* /usr/local/jetty/etc/
COPY target/cas.war /var/lib/jetty/webapps/cas.war

RUN java -jar "$JETTY_HOME/start.jar" --add-to-startd=jmx,stats,https,ssl
