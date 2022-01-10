@echo off

echo "*****************"
echo "*** Test jar *******"
echo "*****************"

docker run --rm -v %cd%/pipeline/java-app:/app -v %cd%/pipeline/root/.m2/:/root/.m2/ maven:3.8.4-openjdk-8 "%1"

@REM cd C:\workspace-all-tutorials\Tutorial-Jenkins\jenkins-handson\jenkins-data
@REM pipeline\jenkins\test\maven-test.bat "mvn test -e -f /app"