FROM docker.io/eclipse-temurin:17-jre-ubi9-minimal


VOLUME /tmp

USER root

ARG JAR_FILE=target/*.jar
ARG APP_DIR=/app
ENV JAVA_APP_DIR=${APP_DIR}

COPY ${JAR_FILE} ${APP_DIR}/app.jar

EXPOSE 8080

USER 1001 

ENTRYPOINT [ \
    "set -v && set && java", \
    "-Djava.security.egd=file:/dev/./urandom", \
    "-D--spring.config.location=file:/application.properties", \
    "-jar", \
    "${JAVA_APP_DIR}/app.jar" \
]
