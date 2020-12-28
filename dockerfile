FROM openjdk:8

RUN apt-get update && apt-get install -y maven
COPY . /project
RUN  cd /project && mvn package -Dmaven.test.skip=true

ENTRYPOINT java -jar /project/target/Twitter-1.0-SNAPSHOT.jar
