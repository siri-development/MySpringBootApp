# ---------- Stage 1: Build the application ----------
FROM maven:3.9.6-eclipse-temurin-21 AS build

WORKDIR /app
COPY . /app
RUN mvn clean package -DskipTests

# ---------- Stage 2: Use Tomcat to serve WAR + JSP ----------
FROM tomcat:10.1-jdk21

# Clean default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR as ROOT.war
COPY --from=build /app/target/Encryption.war /usr/local/tomcat/webapps/ROOT.war

# 🔧 Replace Tomcat's port with Render's dynamic $PORT
RUN sed -i 's/port="8080"/port="${PORT}"/g' /usr/local/tomcat/conf/server.xml

# 🔧 Replace bind address (listen on all interfaces)
RUN sed -i 's/address="127.0.0.1"/address="0.0.0.0"/g' /usr/local/tomcat/conf/server.xml

# 🔧 (Optional) Disable shutdown port to avoid HEAD / errors
RUN sed -i 's/port="8005"/port="-1"/g' /usr/local/tomcat/conf/server.xml

EXPOSE 8080

CMD ["catalina.sh", "run"]
