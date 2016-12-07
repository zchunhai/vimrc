# vimrc
debian8 下编译vim8，并配置为Python开发环境

## 安装依赖
    sudo apt-get update
    sudo apt-get install sudo wget git python-dev python3-dev libncurses5-dev build-essential ctags cmake
    curl https://bootstrap.pypa.io/get-pip.py | sudo python
    curl https://bootstrap.pypa.io/get-pip.py | sudo python3
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    sudo apt-get install -y nodejs

## 下载vim8 源码并解压 [地址](https://github.com/vim/vim/releases)
    tar xf v8.0.xxxx.tar.gz && cd vim-8.0.xxxx/

## 编译vim8
    mkdir /usr/local/vim8/
    ./configure --with-features=huge --enable-python3interp --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python3-config-dir=/usr/lib/python3.4/config-3.4m-x86_64-linux-gnu/ --enable-multibyte --enable-cscope --prefix=/usr/local/vim8/
    make && make install

## 链接到path
    ln -sf /usr/local/vim8/bin/vim /usr/bin/vim
    ln -sf /usr/local/vim8/bin/vim /usr/local/bin/vim

## vimrc 安装步骤：
    sudo pip install Flake8
    npm install -g jshint
    echo "source ~/.vim/vimrc" > ~/.vimrc
    git clone git@github.com:powerlang/vimrc.git ~/.vim
<!-- git submodule update --init --recursive -->
