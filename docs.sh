#!/bin/bash

git clone https://${GITHUB_TOKEN}@github.com/deven96/Simple_GAN.git
cd ./Simple_GAN/docs
sphinx-apidoc -f -o source/ ../adversarials
make html
cd ..
mkdir temp
cp -rf ./Simple_GAN/docs/html/* temp/
cd ./Simple_GAN
git config --global push.default simple
git config --global user.email "travis@travis-ci.com"
git config --global user.name "Travis CI"
git checkout gh-pages
#remove existing files
rm -R ./*
cp -rf ../temp/* .
git commit -am "rebuilt docs"
git push -q https://${GITHUB_TOKEN}@github.com/deven96/Simple_GAN.git gh-pages --force