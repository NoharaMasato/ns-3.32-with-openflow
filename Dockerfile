FROM ubuntu:18.04

RUN apt-get update && apt-get install -y git wget gcc g++ python python3 python3-dev mercurial libxml2 libxml2-dev libboost-all-dev

RUN wget https://www.nsnam.org/release/ns-allinone-3.32.tar.bz2 && tar xjf ns-allinone-3.32.tar.bz2

# build openflow (コードのバージョンの問題でopenflowの一部をsedで書き換えている)
RUN cd /ns-allinone-3.32 && \
    hg clone http://code.nsnam.org/jpelkey3/openflow && \
    cd openflow && \
    sed -i -e "9 s/^/static /" switch/pt_act.c && \
    ./waf configure && ./waf build

# build ns-3
RUN cd /ns-allinone-3.32/ns-3.32 && \
    ./waf configure --enable-examples --enable-tests --with-openflow=../openflow && \
    ./waf build

