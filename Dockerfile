FROM docker.io/eclipse-temurin:17-jre-ubi9-minimal


VOLUME /tmp

USER root

ARG JAR_FILE=target/*.jar
ARG APP_DIR=/app
ENV JAVA_APP_DIR=${APP_DIR}

COPY ${JAR_FILE} ${APP_DIR}/app.jar

EXPOSE 8080

COPY --chmod=755 <<EOF ${APP_DIR}/entrypoint.sh
    #!/usr/bin/env sh
    set -x
    java  -Djava.security.egd=file:/dev/./urandom -jar ${JAVA_APP_DIR}/app.jar
EOF

USER 1001

ENTRYPOINT ${JAVA_APP_DIR}/entrypoint.sh
