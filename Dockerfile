FROM jboss/keycloak:7.0.1

COPY auth-require-role-extension-1.0.0.0-SNAPSHOT.jar /opt/jboss/keycloak/standalone/deployments/

EXPOSE 8080

CMD ["-b", "0.0.0.0"]