FROM maven:amazoncorretto
COPY . /app
WORKDIR /app
RUN mvn clean install
WORKDIR /app/target
CMD ["java","-jar","merchant-0.0.1-SNAPSHOT.jar"]
