FROM maven:3-openjdk-15

WORKDIR /app
COPY pom.xml .
RUN mvn dependency:resolve

COPY src ./src
RUN mvn package -Dmaven.test.skip=true

ENTRYPOINT java -jar /app/target/Twitter-1.0-SNAPSHOT.jar
