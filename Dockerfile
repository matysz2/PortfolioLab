# Używamy obrazu OpenJDK 21
FROM openjdk:21-jdk-slim

# Ustawiamy katalog roboczy w kontenerze
WORKDIR /app

# Kopiujemy plik pom.xml i źródła aplikacji do katalogu roboczego
COPY pom.xml /app/
COPY src /app/src

# Instalujemy Maven
RUN apt-get update && apt-get install -y maven

# Budujemy aplikację, pomijając testy
RUN mvn clean package -DskipTests

# Kopiujemy plik .war do kontenera
COPY target/charity-0.0.1-SNAPSHOT.war /app/charity.war

# Uruchamiamy aplikację Spring Boot za pomocą Java
CMD ["java", "-jar", "/app/charity.war"]
