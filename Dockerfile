# Etap 1: Budowanie aplikacji
FROM openjdk:21-jdk-slim AS builder

# Instalujemy Maven
RUN apt-get update && apt-get install -y maven

# Ustawiamy katalog roboczy
WORKDIR /app

# Kopiujemy plik pom.xml i katalog źródeł aplikacji
COPY pom.xml /app/
COPY src /app/src

# Budujemy aplikację (pomijamy testy w procesie budowania)
RUN mvn clean package -DskipTests

# Etap 2: Uruchamianie aplikacji Spring Boot
FROM openjdk:21-jdk-slim

# Ustawiamy katalog roboczy
WORKDIR /app

# Kopiujemy zbudowany plik .war z etapu budowania
COPY --from=builder /app/target/charity-0.0.1-SNAPSHOT.war /app/charity.war

# Określamy polecenie uruchomienia aplikacji Spring Boot
ENTRYPOINT ["java", "-jar", "/app/charity.war"]

# Otwieramy port 8080 (domyślny port aplikacji Spring Boot)
EXPOSE 8080
