FROM docker.io/eclipse-temurin:17-jre-ubi9-minimal


VOLUME /tmp

USER root

ARG JAR_FILE=target/*.jar
ARG APP_DIR=/app
COPY ${JAR_FILE} ${APP_DIR}/app.jar

EXPOSE 8080

USER 1001 

ENTRYPOINT ["java"]
CMD ["-Djava.security.egd=file:/dev/./urandom", "--spring.config.location=file:/application.properties","-jar ${APP_DIR}/app.jar"]
