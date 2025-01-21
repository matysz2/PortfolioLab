# Używamy oficjalnego obrazu Tomcat z JDK 11
FROM tomcat:9.0-jdk11-openjdk-slim

# Ustawiamy katalog roboczy
WORKDIR /usr/local/tomcat

# Kopiujemy plik .war do katalogu webapps Tomcat, nadpisując ROOT.war
COPY target/charity-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# EXPOSE - Otwieramy port 8080, który jest domyślnym portem Tomcat
EXPOSE 8080

# Uruchamiamy Tomcat, aby aplikacja była dostępna
CMD ["catalina.sh", "run"]
