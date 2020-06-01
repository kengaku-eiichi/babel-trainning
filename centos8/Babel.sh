#!/bin/bash

yum info installed git || yum -y install git

cd "/git/babel-trainning"
nvm --version || {
    git clone git://github.com/creationix/nvm.git /opt/nvm
    ln -snf /opt/nvm/nvm.sh /etc/profile.d/.
    source /etc/profile.d/nvm.sh
    nvm --version
}
cd "/git/babel-trainning/functional-programming-js" || {
    git clone https://github.com/luijar/functional-programming-js.git
    cd "/git/babel-trainning/functional-programming-js" || exit 1
    rm -fr ".git"
}

node -v || {
    # nvm install --lts
    # nvm use --lts
    nvm install stable
    nvm use stable

    node -v || exit 1
    npm -v || exit 1
}
yarn -v || {
    npm i -g yarn
    yarn -v || exit 1
}
yarn -s run babel -V || {
    yarn add --dev babel-cli
    yarn -s run babel -V || exit 1
    yarn add --dev babel-preset-es2015
}
