@echo off

copy "pipeline\java-app\target\*.jar" "pipeline\jenkins\build\"

echo "***************************"
echo "** Building Docker Image **"
echo "***************************"

docker-compose -f pipeline/jenkins/build/docker-compose-build.yaml build --no-cache

@REM cd C:\workspace-all-tutorials\Tutorial-Jenkins\jenkins-handson\jenkins-data
@REM pipeline\jenkins\build\build.bat
