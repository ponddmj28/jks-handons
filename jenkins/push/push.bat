@echo off

echo "***************************"
echo "** Pushing  Image **"
echo "***************************"

SET IMAGE="centos7-prod"

echo "*** Loged out ***"
docker logout
echo "*** Tagging Image ***"
docker tag %IMAGE%:%BUILD_TAG% tosaporn/%IMAGE%:%BUILD_TAG%
echo "*** Loged in ***"
docker login docker.io -u tosaporn -p %PASSWORD_DOCKER%
echo "*** PUSHING ****"
docker push tosaporn/%IMAGE%:%BUILD_TAG%