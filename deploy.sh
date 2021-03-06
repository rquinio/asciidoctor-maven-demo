#!/bin/bash

echo $TRAVIS_REPO_SLUG
echo $TRAVIS_PULL_REQUEST
echo $TRAVIS_BRANCH

if [[ "$TRAVIS_REPO_SLUG" == "rquinio/asciidoctor-maven-demo" ]] && [[ ${TRAVIS_PULL_REQUEST} == "false" ]] && [[ "$TRAVIS_BRANCH" == "master" ]]; then
  echo -e "Publishing site to gh-pages branch...\n"
  
  cd target/site
  git init
  git config user.name "travis-ci"
  git config user.email "travis@travis-ci.org"
  git add .
  git commit -m "Deploy commit $TRAVIS_COMMIT to gh-pages"
  git checkout -b gh-pages
  git push --force --quiet "https://${GH_TOKEN}@github.com/rquinio/asciidoctor-maven-demo" gh-pages > /dev/null 2>&1

fi