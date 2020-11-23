#!/bin/bash

set -eu

sudo apt-get update && sudo apt-get install -y git wget gcc g++ python python3 python3-dev mercurial libxml2 libxml2-dev libboost-all-dev \
     gir1.2-goocanvas-2.0 python-gi python-gi-cairo python-pygraphviz python3-gi python3-gi-cairo python3-pygraphviz gir1.2-gtk-3.0 ipython ipython3 \
     vim x11-apps

# Download ns-3.32-allinone
cd ~/work/ && \
wget https://www.nsnam.org/release/ns-allinone-3.32.tar.bz2 && \
tar xjf ns-allinone-3.32.tar.bz2 && \
rm ns-allinone-3.32.tar.bz2

# Build openflow (コードのバージョンの問題でopenflowの一部をsedで書き換えている)
cd ~/work/ns-allinone-3.32 && \
hg clone http://code.nsnam.org/jpelkey3/openflow && \
cd openflow && \
sed -i -e "9 s/^/static /" switch/pt_act.c && \
./waf configure && ./waf build

# Build ns-3
cd ~/work/ns-allinone-3.32/ns-3.32 && \
./waf configure --enable-examples --enable-tests --with-openflow=../openflow && \
./waf build

