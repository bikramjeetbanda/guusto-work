FROM maven:amazoncorretto
COPY . /app
WORKDIR /app
RUN mvn clean install
WORKDIR /app/target
EXPOSE 8082
CMD ["java","-jar","shopping-0.0.1-SNAPSHOT.jar"]

