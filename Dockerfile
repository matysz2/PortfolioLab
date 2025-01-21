# Używamy obrazu OpenJDK 21
FROM openjdk:21-jdk-slim

# Ustawiamy katalog roboczy
WORKDIR /app

# Kopiujemy pom.xml i źródła aplikacji
COPY pom.xml /app/
COPY src /app/src

# Instalujemy Maven
RUN apt-get update && apt-get install -y maven

# Budujemy aplikację (pomijamy testy)
RUN mvn clean package -DskipTests

# Sprawdzamy zawartość katalogu target, aby upewnić się, że plik .war istnieje
RUN ls -l /app/target/

# Sprawdzamy, czy plik .war istnieje przed kopiowaniem
RUN if [ -f /app/target/charity-0.0.1-SNAPSHOT.war ]; then echo "Plik .war istnieje"; else echo "Plik .war nie istnieje"; fi

# Kopiujemy plik .war do kontenera
COPY /app/target/charity-0.0.1-SNAPSHOT.war /app/charity.war

# Uruchamiamy aplikację Spring Boot
CMD ["java", "-jar", "/app/charity.war"]
