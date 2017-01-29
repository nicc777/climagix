#!/bin/sh

mkdir -p $HOME/.climagix

docker run -v $HOME/.climagix:/home/auser -it climagix /bin/bash -l
