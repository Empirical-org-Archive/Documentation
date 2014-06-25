git branch -D gh-pages
git checkout --orphan gh-pages
nanoc
git rm --cached -r .
git clean -df -e output -e .gitignore
