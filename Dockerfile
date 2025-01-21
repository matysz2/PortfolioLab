FROM openjdk:21-jdk-slim

# Kopiujemy kod źródłowy do kontenera
COPY src /app/src
COPY pom.xml /app

# Przechodzimy do katalogu z projektem
WORKDIR /app

# Budujemy aplikację za pomocą Mavena
RUN mvn clean package

# Uruchamiamy aplikację
CMD ["java", "-jar", "target/your-app.jar"]
