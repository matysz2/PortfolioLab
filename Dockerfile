# Użyj obrazu z OpenJDK 11
FROM openjdk:11-jre-slim

# Zainstaluj Maven (jeśli potrzebujesz go do budowania projektu w kontenerze)
RUN apt-get update && apt-get install -y maven

# Skopiuj kod źródłowy do kontenera
COPY . /app

# Przejdź do katalogu z aplikacją
WORKDIR /app

# Zbuduj aplikację, jeśli nie została jeszcze zbudowana (opcjonalne, jeśli plik war jest już gotowy)
RUN mvn clean package

# Skopiuj plik .war do kontenera
COPY target/PortfolioLab.war /app/PortfolioLab.war

# Uruchom aplikację
CMD ["java", "-jar", "/app/PortfolioLab.war"]
