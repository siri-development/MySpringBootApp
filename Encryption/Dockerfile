# -------- Stage 1: Build the Spring Boot app --------
FROM maven:3.9.6-eclipse-temurin-21 AS builder

# Set working directory
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .

# Pre-fetch dependencies to leverage caching
RUN mvn dependency:go-offline

# Copy the rest of the project (src, mvnw, etc.)
COPY . .

# Package the application (creates target/*.jar)
RUN mvn clean package -DskipTests

# -------- Stage 2: Run the app --------
FROM eclipse-temurin:21-jdk

# Set working directory
WORKDIR /app

# Copy built JAR from builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose Spring Boot default port
EXPOSE 8080

# Run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
