# Etap 1: Budowanie aplikacji
FROM openjdk:21-jdk-slim as builder

# Ustawiamy katalog roboczy
WORKDIR /app

# Kopiujemy plik pom.xml i katalog źródeł aplikacji
COPY pom.xml /app/
COPY src /app/src

# Budujemy aplikację (pomijamy testy w procesie budowania)
RUN mvn clean package -DskipTests

# Etap 2: Uruchamianie aplikacji Spring Boot
FROM openjdk:21-jre-slim

# Ustawiamy katalog roboczy
WORKDIR /app

# Kopiujemy zbudowany plik .jar z etapu budowania
COPY --from=builder /app/target/charity-0.0.1-SNAPSHOT.jar /app/charity.jar

# Określamy polecenie uruchomienia aplikacji Spring Boot
ENTRYPOINT ["java", "-jar", "/app/charity.jar"]

# Otwieramy port 8080 (domyślny port aplikacji Spring Boot)
EXPOSE 8080
