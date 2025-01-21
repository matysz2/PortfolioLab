# Używamy obrazu z JDK 21
FROM openjdk:21-jdk-slim

# Instalujemy Maven
RUN apt-get update && apt-get install -y maven

# Kopiujemy kod źródłowy i plik pom.xml do katalogu /app
COPY src /app/src
COPY pom.xml /app

# Ustalamy katalog roboczy na /app
WORKDIR /app

# Budujemy aplikację, pomijając testy
RUN mvn clean package -DskipTests

# Uruchamiamy aplikację
CMD ["java", "-jar", "target/your-app.jar"]
