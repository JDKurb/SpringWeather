FROM openjdk:17-alpine

EXPOSE 8080

ADD /bitnami/jenkins/home/jobs/GradleBuildDeploy/workspace/build/libs/web-0.0.1-plain.jar web-0.0.1-plain.jar

ENTRYPOINT [ "java", "-jar", "web-0.0.1-plain.jar" ]