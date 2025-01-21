# Użyj oficjalnego obrazu JDK
FROM openjdk:11-jre-slim

# Skopiuj plik .war do kontenera
COPY target/PortfolioLab.war /app/PortfolioLab.war

# Uruchom aplikację Java
CMD ["java", "-jar", "/app/PortfolioLab.war"]
