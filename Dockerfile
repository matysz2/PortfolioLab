# Użyj obrazu OpenJDK 11
FROM openjdk:11-jre-slim

# Zainstaluj Maven
RUN apt-get update && apt-get install -y maven

# Skopiuj cały kod źródłowy do kontenera
COPY . /app

# Zmień katalog roboczy na /app
WORKDIR /app

# Zbuduj aplikację
RUN mvn clean package

# Sprawdź, czy plik .war jest wygenerowany
RUN ls -l target

# Skopiuj plik .war do kontenera
COPY target/PortfolioLab.war /app/PortfolioLab.war

# Uruchom aplikację
CMD ["java", "-jar", "/app/PortfolioLab.war"]
