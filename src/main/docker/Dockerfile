FROM jetty:9.3.12
MAINTAINER ylli@thoughtworks.com

EXPOSE 8443
COPY etc/cas.properties /etc/cas/cas.properties
COPY etc/log4j2.xml /etc/cas/log4j2.xml
COPY etc/thekeystore /var/lib/jetty/etc/keystore
COPY etc/jetty/* /usr/local/jetty/etc/
COPY cas.war /var/lib/jetty/webapps/cas.war
COPY etc/change_domain_name.sh /
RUN java -jar "$JETTY_HOME/start.jar" --add-to-startd=jmx,stats,https,ssl

ENTRYPOINT ["/change_domain_name.sh && /docker-entrypoint.sh"]
CMD ["java","-jar","/usr/local/jetty/start.jar"]
