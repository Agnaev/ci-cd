#!/bin/sh
docker login -u "$DOCKER_USER" -p "$DOCKER_PASS"
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
REPO=$(echo "$TRAVIS_REPO_SLUG" | tr '[:upper:]' '[:lower:]')
docker build -f Dockerfile -t "$REPO":"$TAG" .
echo "travis repo slug $REPO"
docker push "$TRAVIS_REPO_SLUG"