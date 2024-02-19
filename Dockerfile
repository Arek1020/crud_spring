# FROM maven:3.8.4-jdk-11 AS java-build
# WORKDIR /app
# COPY api/pom.xml ./
# RUN mvn dependency:go-offline
# COPY api/src ./src
# RUN mvn package -DskipTests

# FROM node:14 as react-build
# WORKDIR /app
# COPY view/package.json view/package-lock.json ./
# RUN npm install
# COPY view ./
# RUN npm run build

FROM openjdk:19-jdk
FROM maven:3.8.7-eclipse-temurin-19
WORKDIR /app
COPY api/pom.xml ./
RUN mvn dependency:go-offline
COPY api/src ./src
RUN mvn clean package  
# COPY --from=react-build /app/build ./view/build
EXPOSE 8080
# CMD ["java", "-jar", "api-1.0.jar"]
# COPY api/target/*.jar app.jar
# ARG JAR_FILE=target/*.jar
# ADD ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app/target/api-1.0.jar"]
