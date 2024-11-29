#!/usr/bin/env bash
MYDIR=$(dirname $0)
if [[ "$1" == "" ]]; then
  read -e -i "${DOCKER_ACCOUNT}" -p "Please enter your DockerHub user/account name: " input
  name="${input:-$DOCKER_ACCOUNT}"
else
  DOCKER_ACCOUNT=$1
fi

echo "📦 Building image ${DOCKER_ACCOUNT}/java-goof:latest ..."
docker build --platform linux/arm64 -t ${DOCKER_ACCOUNT}/java-goof:latest $MYDIR/..
echo
echo "🚚 Pushing image to DockerHub..."
docker push --platform linux/arm64 ${DOCKER_ACCOUNT}/java-goof:latest
