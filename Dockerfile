FROM maven:3.8.4-jdk-11 AS java-build
WORKDIR /app
COPY api/pom.xml ./
RUN mvn dependency:go-offline
COPY api/src ./src
RUN mvn package -DskipTests

FROM node:14 as react-build
WORKDIR /app
COPY view/package.json view/package-lock.json ./
RUN npm install
COPY view ./
RUN npm run build

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=java-build /app/target/api.jar ./
# COPY --from=react-build /app/build ./view/build
EXPOSE 8080
CMD ["java", "-jar", "backend.jar"]
