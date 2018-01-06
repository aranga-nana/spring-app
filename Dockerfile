FROM openjdk:8u151-jdk as builder
RUN mkdir /opt/work -p

COPY . /opt/work
WORKDIR /opt/work
RUN chmod +x gradlew && \
           ./gradlew build
FROM  store/oracle/serverjre:8

ENV SERVER_PORT 80

RUN ln -s /usr/share/zoneinfo/Australia/Melbourne /etc/localtime \
   && mkdir /var/commission-excels -p \
   && mkdir /opt/app -p
WORKDIR /opt/app
COPY --from=builder /opt/work/build/libs/spring-*.jar app.jar
EXPOSE 80
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Duser.timezone=Australia/Melbourne","-jar","/opt/app/app.jar"]
