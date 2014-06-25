git branch -D gh-pages
git checkout --orphan gh-pages
nanoc
git rm --cached -r .
git clean -dfe output
git clean -df -e output -e .gitignore
