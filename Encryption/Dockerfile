# ---------- Stage 1: Build the application ----------
FROM maven:3.9.6-eclipse-temurin-21 AS build

WORKDIR /app
COPY . /app
RUN mvn clean package -DskipTests

# ---------- Stage 2: Use Tomcat to serve WAR + JSP ----------
FROM tomcat:10.1-jdk21

# Clean default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR
COPY --from=build /app/target/Encryption.war /usr/local/tomcat/webapps/ROOT.war

# Expose default port (Render sets this dynamically)
EXPOSE 8080

# Use ENV for flexibility (Render provides $PORT)
ENV PORT=8080

# Replace default port in Tomcat config to use dynamic $PORT
RUN sed -i "s/port=\"8080\"/port=\"\${PORT}\"/" /usr/local/tomcat/conf/server.xml

# Start Tomcat
CMD ["catalina.sh", "run"]
