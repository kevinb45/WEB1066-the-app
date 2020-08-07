# https://hub.docker.com/_/node/
FROM openjdk:9
COPY . /usr/src/the-app
WORKDIR /usr/src/the-app
RUN javac Main.java
CMD ["java", "Main"]