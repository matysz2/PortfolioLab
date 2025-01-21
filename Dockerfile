# Wybieramy oficjalny obraz JDK 11
FROM openjdk:21-jre-slim

# Instalujemy Maven
RUN apt-get update && apt-get install -y maven

# Kopiujemy kod źródłowy do kontenera
WORKDIR /app
COPY . /app

# Budujemy aplikację za pomocą Mavena
RUN mvn clean package

# Uruchamiamy aplikację
CMD ["java", "-jar", "target/PortfolioLab.war"]
