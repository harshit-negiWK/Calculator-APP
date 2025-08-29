# Stage 1: Build the application
FROM maven:3.6.3-jdk-8 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/CalculatorSampleApp-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8081
CMD ["java", "-jar", "app.jar"]
