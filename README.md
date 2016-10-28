CAS Service
============================

Generic CAS maven war overlay to exercise the latest versions of CAS. This overlay could be freely used as a starting template for local CAS maven war overlays. The CAS services management overlay is available [here](https://github.com/Jasig/cas-services-management-overlay).

# Versions

```xml
<cas.version>4.2.4</cas.version>
```

# Configuration

The `etc` directory contains the configuration files that need to be copied to `/etc/cas`.

Current files are:

* `cas.properties`
* `log4j2.xml`

# Build

```bash
# Download utility scripts
wget https://github.com/tw-leansw/leansw-build-utility/archive/master.zip
unzip master.zip && mv leansw-build-utility-master _

# Create cas.war
sh _/maven_build.sh

# Create docker image and push
cp -r etc target/
docker login -u leansw reg.dev.twleansw.com
sh _/docker_build.sh dev cas-service
```

# Run on local

* Create a Java keystore at `/etc/cas/jetty/thekeystore` with the password `changeit`.
* Import your CAS server certificate inside this keystore.

```bash
mvnw jetty:run-forked
```

CAS will be available at:

* `http://cas.server.name:9080/cas`
* `https://cas.server.name:8443/cas`

