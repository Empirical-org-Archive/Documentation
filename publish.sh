git branch -D gh-pages
git checkout --orphan gh-pages
nanoc
git rm --cached -r .
git clean -df -e output

echo tmp         >> .gitignore
echo crash.log   >> .gitignore
echo .sass-cache >> .gitignore

git add .
git commit -m publish
git push -f origin gh-pages
git chekcout nanoc
