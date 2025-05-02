# # ---- Stage 1: Build the application using Maven ----

########################################################
## multistage dockefile
#################################################


#     FROM maven:3-eclipse-temurin-21-alpine AS build

#     # Set working directory inside the container
#     WORKDIR /app
    
#     # Copy the entire source code
#     COPY . .
    
#     # Overwrite the default application.properties with a custom one
#     # Ensure the path is correct relative to WORKDIR
#     #COPY application.properties src/main/resources/application.properties
    
#     # Run Maven build
#     RUN mvn clean package -DskipTests
    
#     # ---- Stage 2: Run the app on Tomcat ----
#     FROM tomcat:9.0
    
#     # Remove default Tomcat apps to clean up
#     RUN rm -rf /usr/local/tomcat/webapps/*
    
#     # Copy the built WAR from the previous stage to Tomcat's ROOT context
#     COPY --from=build /app/target/onlinebookstore.war /usr/local/tomcat/webapps/ROOT.war
    
#     # Expose port 8080
#     EXPOSE 8080
    
#     # Default command to run Tomcat
#     CMD ["catalina.sh", "run"]


#######################################################


# Use Tomcat base image
FROM tomcat:9.0

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into Tomcat's webapps directory
COPY target/onlinebookstore.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8080

