#!/bin/sh
OLD_DOMAIN_NAME="${OLD_CAS_DOMAIN_NAME:=cas.dev.twleansw.com}"
DOMAIN_NAME="${CAS_DOMAIN_NAME:=cas.dev.twleansw.com}"
sed -i -- "s/${OLD_CAS_DOMAIN_NAME}/${DOMAIN_NAME}/g" /etc/cas/cas.properties