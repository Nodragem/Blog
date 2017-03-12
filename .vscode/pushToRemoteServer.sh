cd /d/Hugo/Sites/bookshelf
rm -r public/*
cd /d/Hugo/Sites/bookshelf/public
(cd ..; hugo --theme=academic)
git add --all .
git commit -m "update content `date`"
git push -f origin gh-pages