FROM openjdk:17-jdk-slim
VOLUME /tmp
COPY target/pi-service.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
