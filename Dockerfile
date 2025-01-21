# Używamy oficjalnego obrazu JDK jako bazy
FROM openjdk:21-jdk-slim

# Ustawiamy katalog roboczy
WORKDIR /app

# Kopiujemy plik pom.xml i źródła aplikacji
COPY pom.xml /app/
COPY src /app/src

# Instalujemy Maven
RUN apt-get update && apt-get install -y maven

# Budujemy aplikację (pomijamy testy)
RUN mvn clean package -DskipTests

# Kopiujemy plik .war do kontenera
COPY target/charity-0.0.1-SNAPSHOT.war /app/charity.war

# EXPOSE - w przypadku Render musisz otworzyć odpowiedni port
EXPOSE 8080

# Uruchamiamy aplikację Spring Boot
CMD ["java", "-jar", "/app/charity.war"]
