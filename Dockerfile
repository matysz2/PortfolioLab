# Etap 1: Budowanie aplikacji
FROM maven:3.8.4-openjdk-21-slim AS builder

# Ustawiamy katalog roboczy
WORKDIR /app

# Kopiujemy pliki do kontenera
COPY pom.xml /app/
COPY src /app/src

# Budujemy aplikację (pomijamy testy w procesie budowania)
RUN mvn clean package -DskipTests

# Etap 2: Uruchamianie aplikacji
FROM openjdk:21-jre-slim

# Ustawiamy katalog roboczy
WORKDIR /app

# Kopiujemy plik .jar z etapu budowania do kontenera
COPY --from=builder /app/target/charity-0.0.1-SNAPSHOT.jar /app/charity.jar

# Określamy polecenie uruchamiania aplikacji Spring Boot
ENTRYPOINT ["java", "-jar", "charity.jar"]

# Otwieramy port 8080 (domyślny port aplikacji Spring Boot)
EXPOSE 8080
