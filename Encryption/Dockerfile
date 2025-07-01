# Use a minimal OpenJDK 21 base image
FROM openjdk:21-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR from target to the working directory
COPY target/*.jar app.jar

# Expose the default port for Spring Boot
EXPOSE 8080

# Run the Spring Boot JAR
ENTRYPOINT ["java", "-jar", "app.jar"] 
