# Dockerfile keycloak
## Overview
This is made to work on a server side, it can be adapted to work on local side.
The keycloak version is the 7.0.1

## Server configuration
The server environment variables will allow you to configure the keycloak database

-   KEYCLOAK_PASSWORD (Password for admin)
-   KEYCLOAK_USER (Login admin)
-   PORT (Exposed port for docker, here 8080)
-   PROXY_ADDRESS_FORWARDING (An option to allow redirect uri behind a proxy)
   
To connect to an external db (highly recommended for a server, or during a restart everything can be loast):

-   DB_ADDR (Db host) 
-   DB_DATABASE (Db name)
-   DB_PASSWORD (Db password)
-   DB_PORT (Db  port)
-   DB_USER (User to connect to the db)
-   DB_VENDOR  (Db type, postgres, mongodb, mysql..)

## Configuration for local
```dockerfile
FROM jboss/keycloak:7.0.1

COPY deployments /opt/jboss/keycloak/standalone/deployments

ENV KEYCLOAK_USER=admin

ENV KEYCLOAK_PASSWORD=admin

EXPOSE 8080

CMD ["-b", "0.0.0.0"]
```

## Launch
```sh
$ sudo docker build --tag mykeycloack .
$ sudo docker run --publish 8080:8080 mykeycloack
```

## ssh error
Sometimes, keycloak will refuse the connection to the admin interface because of an invalid ssh for the server.
To fix this, connect to the database and update the realm table by doing:
```sql
update realm set ssl_required='NONE';
```
It will be usefull when a server manage by himself the ssh certificate (as on clevercloud)

## add plugins
If you want to add a new plugin to keycloak, just add the .jar file in the deployments folder