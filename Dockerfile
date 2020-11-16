FROM maven:3-jdk-8

RUN git clone https://github.com/KornSiwat/atm-web.git

WORKDIR atm-web/

COPY pom.xml .
RUN mvn -B dependency:resolve dependency:resolve-plugins

COPY src ./src/
RUN mvn compile

EXPOSE 8090
CMD ["mvn", "spring-boot:run"]
