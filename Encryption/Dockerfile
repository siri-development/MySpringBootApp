# ---------- Stage 1: Build the application ----------
FROM maven:3.9.6-eclipse-temurin-21 AS build

# Set working directory inside the container
WORKDIR /app

# Copy your Spring Boot WAR-based project files into the container
COPY . /app

# Build the WAR file
RUN mvn clean package -DskipTests

# ---------- Stage 2: Use Tomcat to serve WAR + JSP ----------
FROM tomcat:10.1-jdk21

# Optional: clean default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR from the previous stage into Tomcat's webapps folder
#COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
COPY --from=build /app/target/Encryption.war /usr/local/tomcat/webapps/ROOT.war


# Expose the default Tomcat port
EXPOSE 8080

# Tomcat automatically starts up
