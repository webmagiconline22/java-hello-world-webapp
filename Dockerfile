# Build stage
FROM maven:3.8-jdk-11 as build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src/ /app/src/
RUN mvn package -DskipTests

# Run stage
FROM tomcat:latest
COPY --from=build /app/target/* /usr/local/tomcat/webapps/
ENV JAVA_OPTS="-Xmx512m"
EXPOSE 8080
CMD ["catalina.sh", "run"]
