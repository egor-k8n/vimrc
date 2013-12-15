GITPLUGINS="\
https://github.com/bling/vim-airline.git;\
https://github.com/godlygeek/tabular.git;\
https://github.com/guns/vim-clojure-static.git;\
https://github.com/majutsushi/tagbar.git;\
https://github.com/mattn/ctrlp-mark.git;\
https://github.com/mattn/ctrlp-register.git;\
https://github.com/mitsuhiko/vim-python-combined.git;\
https://github.com/pbrisbin/html-template-syntax.git;\
https://github.com/scrooloose/nerdcommenter.git;\
https://github.com/scrooloose/nerdtree.git;\
https://github.com/scrooloose/syntastic.git;\
https://github.com/tkztmk/vim-vala.git;\
https://github.com/tpope/vim-surround.git;\
https://github.com/zaki/zazen.git;\
"

HGPLUGINS="\
https://bitbucket.org/kien/ctrlp.vim;\
https://bitbucket.org/sjl/gundo.vim;\
https://bitbucket.org/sjl/splice.vim;\
"

sanity_checks() {
    HG=""
    HGGIT=""
    GIT=""
    if type "hg" > /dev/null 2>&1; then
        HG="yes"
    fi
    if $(hg help | grep "hggit" > /dev/null); then
        HGGIT="yes"
    fi
    if type "git" > /dev/null 2>&1; then
        GIT="yes"
    fi
    if [ "$HG" = "" ]; then echo ":: hg is not available, can not install mercurial-hosted plugins, exiting."; exit; fi
    if [ "$HGGIT" = "" ]; then
        if [ "$GIT" = "" ]; then
            echo ":: neither hg-git plugin nor git is available, can not install git-hosted plugins, exiting."
            exit
        fi
    fi
}

copy_config() {
    echo ":: Copying config file"
    cp vimrc ~/.vimrc
}

install_plugins() {
    echo ":: Installing pathogen"
    if [ "$HGGIT" = "yes" ]; then
        hg clone --quiet git+https://github.com/tpope/vim-pathogen.git ~/.vim
    else
        git clone --quiet https://github.com/tpope/vim-pathogen.git ~/.vim
    fi

    for p in $(echo $GITPLUGINS | tr ";" "\n"); do
        echo ":: Installing $p"
        if [ "$HGGIT" = "yes" ]; then
            hg clone --quiet git+$p ~/.vim/bundle/$(echo $p | sed -e 's|://|-|' | sed -e 's|/|-|g')
        else
            git clone --quiet $p ~/.vim/bundle/$(echo $p | sed -e 's|://|-|' | sed -e 's|/|-|g')
        fi
    done

    for p in $(echo $HGPLUGINS | tr ";" "\n"); do
        echo ":: Installing $p"
        hg clone --quiet $p ~/.vim/bundle/$(echo $p | sed -e 's|://|-|' | sed -e 's|/|-|g')
    done
}

sanity_checks

if [ -f ~/.vimrc ]; then
    while true; do
        read -p "You already have a .vimrc file, do you want to replace it? (y/n): " yn
        case $yn in
            [Yy]* ) copy_config; break;;
            [Nn]* ) break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
else
    copy_config;
fi

if [ -d ~/.vim ]; then
    while true; do
        read -p "You already have a .vim directory, do you want to remove it's contents before installing any plugins? (y/n): " yn
        case $yn in
            [Yy]* ) rm -rf ~/.vim; install_plugins; break;;
            [Nn]* ) install_plugins; break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
else
    install_plugins;
fi
