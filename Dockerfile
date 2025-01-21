# Użyj obrazu OpenJDK 11
FROM openjdk:11-jre-slim

# Zainstaluj Maven (jeśli jeszcze nie jest zainstalowany)
RUN apt-get update && apt-get install -y maven

# Skopiuj cały kod źródłowy do kontenera
COPY . /app

# Zmień katalog roboczy na /app
WORKDIR /app

# Zbuduj aplikację
RUN mvn clean package

# Skopiuj plik .war do kontenera
COPY target/PortfolioLab.war /app/PortfolioLab.war

# Uruchom aplikację Java
CMD ["java", "-jar", "/app/PortfolioLab.war"]
