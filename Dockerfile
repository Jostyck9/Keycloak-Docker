FROM jboss/keycloak:latest

COPY deployments /opt/jboss/keycloak/standalone/deployments

ENV KEYCLOAK_USER=admin

ENV KEYCLOAK_PASSWORD=admin

EXPOSE 8080

CMD ["-b", "0.0.0.0"]