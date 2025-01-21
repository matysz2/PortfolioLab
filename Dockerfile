# Etap 1: Budowanie aplikacji
FROM openjdk:21-jdk-slim as builder

# Ustawiamy katalog roboczy
WORKDIR /app

# Instalujemy Maven (jeśli nie jest zainstalowany)
RUN apt-get update && apt-get install -y maven

# Kopiujemy pliki do kontenera
COPY pom.xml /app/
COPY src /app/src

# Budujemy aplikację
RUN mvn clean package -DskipTests

# Sprawdzamy, czy plik .war istnieje
RUN ls -l /app/target/

# Etap 2: Uruchamianie aplikacji na Tomcat
FROM tomcat:9.0-jdk11-openjdk

# Kopiujemy plik .war z etapu budowania do folderu webapps Tomcat
COPY --from=builder /app/target/charity-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/charity.war

# Uruchamiamy Tomcat
CMD ["catalina.sh", "run"]
