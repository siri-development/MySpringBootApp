# ---------- Stage 1: Build the application ----------
FROM maven:3.9.6-eclipse-temurin-21 AS build

# Set working directory inside the container
WORKDIR /app

# Copy your Spring Boot project files into the container
COPY . /app

# Build the Spring Boot project using Maven
RUN mvn clean package -DskipTests

# ---------- Stage 2: Create lightweight runtime image ----------
FROM eclipse-temurin:21-jdk

# Set working directory for running the app
WORKDIR /app

# Copy the built JAR file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port your Spring Boot app runs on (usually 8080)
EXPOSE 8080

# Command to run the Spring Boot app
CMD ["java", "-jar", "app.jar"]
