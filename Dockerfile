# Użyj obrazu z OpenJDK
FROM openjdk:11-jre-slim

# Zainstaluj git i maven (jeśli jeszcze nie są w obrazie)
RUN apt-get update && apt-get install -y git maven

# Skopiuj plik pom.xml do kontenera (jeśli używasz Mavena)
COPY pom.xml /app/pom.xml

# Przejdź do katalogu roboczego
WORKDIR /app

# Pobierz kod z GitHub (reponame zastąp pełnym linkiem do repo)
RUN git clone https://github.com/TwojeUserName/TwojeRepo.git .

# Zbuduj projekt (jeśli używasz Mavena)
RUN mvn clean package

# Skopiuj plik .war do kontenera
COPY target/PortfolioLab.war /app/PortfolioLab.war

# Uruchom aplikację Java
CMD ["java", "-jar", "/app/PortfolioLab.war"]
