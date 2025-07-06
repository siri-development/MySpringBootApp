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

# Make sure Tomcat binds to all interfaces
# (Not just localhost — this is crucial for Render)
RUN sed -i 's/address="127.0.0.1"/address="0.0.0.0"/g' /usr/local/tomcat/conf/server.xml

# Expose default port (Render uses 8080)
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
