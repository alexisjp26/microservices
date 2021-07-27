#Build Stage
FROM gradle:jdk16 as build
WORKDIR /app
COPY . .
RUN gradle --no-daemon clean build

#Run Stage
FROM openjdk:16.0-jdk as runtime
WORKDIR /app
COPY --from=build /app/build/libs/*.jar service.jar
CMD ["java", "-jar", "/app/service.jar"]
