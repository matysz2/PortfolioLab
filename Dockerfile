# Wersja JDK
FROM openjdk:21-jdk-slim

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

# Kopiujemy plik .war do kontenera
COPY /app/target/charity-0.0.1-SNAPSHOT.war /app/charity.war

# Uruchamiamy aplikację Spring Boot
CMD ["java", "-jar", "/app/charity.war"]
