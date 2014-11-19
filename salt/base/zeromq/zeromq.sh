#!/bin/sh

#Move to tmp
cd /tmp

# Download 4.0.5 source code and extract it
wget http://download.zeromq.org/zeromq-4.0.5.tar.gz
tar -xf zeromq-4.0.5.tar.gz

# Move to new directory
cd /tmp/zeromq-4.0.5

# Install zmq
./configure
make
make install

# Update lib cache
ldconfig