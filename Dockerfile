FROM openjdk:11-jdk-slim
WORKDIR /app
COPY target/java-docker-jenkins-1.0.jar app.jar
CMD ["java", "-jar", "app.jar"]
