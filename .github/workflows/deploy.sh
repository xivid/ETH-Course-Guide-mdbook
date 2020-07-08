#!/bin/bash
wget https://github.com/Xivid/mdBook/releases/download/selfv1/mdbook
chmod +x mdbook
echo Generate book
./mdbook build
rm mdbook
echo Checkout gh-pages
git checkout gh-pages || git checkout -b gh-pages
#git pull origin gh-pages --rebase
echo ls@gh-pages
ls -al
echo Copy book sources
cp -R book/* .
git clean -fx book
git add .
COMMIT_MESSAGE="Update mdbook `date '+%Y-%m-%d %H:%M:%S'`"
git commit -a -m "${COMMIT_MESSAGE}"
git push -f origin gh-pages
git checkout master
