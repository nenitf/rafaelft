#!/usr/bin/env bash

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd dist

echo '# RafaelMoreiraFT
## Configurações externas do projeto
* [fotos](https://gist.github.com/RafaelMoreiraFT/e357602e67f1d7de9ced0741c6378873);
* [vídeos](https://gist.github.com/RafaelMoreiraFT/99e41c4dac44f00217ae9a8cd8ca8d7e);

## Código fonte
[source](https://github.com/nenitf/rafaelmoreiraft)' > README.md

# if you are deploying to a custom domain
# echo 'rafaelmoreiraft.com' > CNAME

git init
git add -A
git commit -m 'deploy :octocat:'

# if you are deploying to https://<USERNAME>.github.io
git push -f https://github.com/RafaelMoreiraFT/RafaelMoreiraFT.github.io.git master

cd -
