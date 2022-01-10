@echo off

echo "*****************"
echo "*** Building jar *******"
echo "*****************"

docker run --rm -v %CD%/pipeline/java-app:/app -v %CD%/pipeline/root/.m2/:/root/.m2/ maven:3.8.4-openjdk-8 "%1"

@REM cd C:\workspace-all-tutorials\Tutorial-Jenkins\jenkins-handson\jenkins-data
@REM pipeline\jenkins\build\maven-build.bat "mvn clean install -e -f /app"