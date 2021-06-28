FROM jboss/keycloak:11.0.0
WORKDIR /opt/jboss/keycloak
USER root
COPY wait /wait
COPY init-realm.json /usr/src/myapp/config/init-realm.json
COPY run.sh /run.sh
RUN chmod u+x /wait
RUN chmod u+x /run.sh
EXPOSE 8443 8080
ENTRYPOINT [ "sh", "/run.sh" ]
CMD ["-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-Dkeycloak.migration.strategy=OVERWRITE_EXISTING -Djboss.as.management.blocking.timeout=7200 -Djava.net.preferIPv4Stack=trues"]
