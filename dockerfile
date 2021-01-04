FROM maven:3-openjdk-15

COPY . /project
RUN  cd /project && mvn package -Dmaven.test.skip=true

ENTRYPOINT java -jar /project/target/Twitter-1.0-SNAPSHOT.jar
