#!/bin/bash

wget https://dl.google.com/go/go1.13.7.linux-amd64.tar.gz

tar -C /usr/local -xzf go1.13.7.linux-amd64.tar.gz

echo 'export PATH=$PATH:/usr/local/go/bin
      export GOROOT=/usr/local/go
      export GOBIN=/usr/local/go/bin
      export GO111MODULE="on"'> ~/.profile

source ~/.profile
ln -s  /usr/local/go/bin/go /usr/bin/go
go env
