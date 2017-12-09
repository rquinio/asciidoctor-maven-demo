#!/bin/bash

echo -e "Publishing site to gh-pages branch...\n"
cd target/site
git init
git config user.name "travis-ci"
git config user.email "travis@travis-ci.org"
git add .
git commit -m "Deploy Travis build $TRAVIS_BUILD_NUMBER to gh-pages"
git push --force --quiet -u "https://${GH_TOKEN}@github.com/rquinio/asciidoctor-maven-demo" gh-pages > /dev/null 2>&1