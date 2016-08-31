FROM jetty:9.3.10
EXPOSE 8443
MAINTAINER ylli@thoughtworks.com
RUN java -jar "$JETTY_HOME/start.jar" --add-to-startd=jmx,stats,https,ssl
COPY etc/cas.properties /etc/cas/cas.properties
COPY etc/log4j2.xml /etc/cas/log4j2.xml
COPY etc/thekeystore /var/lib/jetty/etc/keystore
COPY etc/server.cer /var/lib/jetty/etc/server.cer
#COPY target
#COPY etc/*.json /cas-overlay/src/main/resources/services/
COPY target/cas.war /var/lib/jetty/webapps/cas.war
COPY etc/jetty/jetty-https.xml /usr/local/jetty/etc/jetty-https.xml
COPY etc/jetty/jetty-ssl.xml /usr/local/jetty/etc/jetty-ssl.xml
COPY etc/jetty/jetty-ssl-context.xml /usr/local/jetty/etc/jetty-ssl-context.xml
COPY etc/jetty/jetty.xml /usr/local/jetty/etc/jetty.xml

