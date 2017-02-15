#!/bin/sh
OLD_LDAP_URL="${OLD_LDAP_URL:=deliflow-ldap-server:389}"
LDAP_URL="${LDAP_URL:=deliflow-ldap-server:389}"
OLD_CAS_DOMAIN_NAME="${OLD_CAS_DOMAIN_NAME:=cas.dev.twleansw.com}"
CAS_DOMAIN_NAME="${CAS_DOMAIN_NAME:=cas.dev.twleansw.com}"
sed -i -- "s/${OLD_CAS_DOMAIN_NAME}/${CAS_DOMAIN_NAME}/g" /etc/cas/cas.properties
sed -i -- "s/${OLD_LDAP_URL}/${LDAP_URL}/g" /etc/cas/cas.properties