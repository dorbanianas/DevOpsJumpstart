FROM openjdk:8
EXPOSE 8080
ADD target/myapp-demo.jar myapp-demo.jar
ENTRYPOINT ["java","-jar","/myapp-demo.jar"]