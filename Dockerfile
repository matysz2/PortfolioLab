FROM openjdk:21-jdk-slim

# Instalujemy Maven
RUN apt-get update && apt-get install -y maven

# Kopiujemy kod źródłowy i plik pom.xml do katalogu /app
COPY pom.xml /app
COPY src /app/src

# Ustalamy katalog roboczy na /app
WORKDIR /app

# Budujemy aplikację, pomijając testy
RUN mvn clean package -DskipTests

# Debugowanie: sprawdzamy zawartość katalogu target przed kopiowaniem pliku .war
RUN ls -l /app/target/

# Kopiujemy plik .war do kontenera
COPY target/charity-0.0.1-SNAPSHOT.war /app/charity.war

# Uruchamiamy aplikację
CMD ["java", "-jar", "/app/charity.war"]
