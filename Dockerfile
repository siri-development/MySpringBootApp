# -------- Stage 1: Build the Spring Boot app --------
FROM maven:3.9.6-eclipse-temurin-21 as builder

WORKDIR /app

# Copy source code
COPY . .

# Build the application (will create target/*.jar)
RUN mvn clean package -DskipTests

# -------- Stage 2: Run the app --------
FROM openjdk:21-jdk-slim

WORKDIR /app

# Copy the built JAR from the previous stage
COPY --from=builder /app/target/*.jar app.jar

# Expose port (optional)
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
