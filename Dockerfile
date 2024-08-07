# FROM maven:3.9.0-eclipse-temurin-17 as build
# WORKDIR /app
# COPY . .
# RUN mvn  package  -Dcheckstyle.skip

# FROM eclipse-temurin:17-jdk-alpine
# WORKDIR /app
# COPY --from=build /app/target/*.jar /app/app.jar
# EXPOSE 8080
# CMD [ "java", "-jar", "app.jar" ]

FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY /target/*.jar /app/app.jar
EXPOSE 8080
CMD [ "java", "-jar", "app.jar" ]
