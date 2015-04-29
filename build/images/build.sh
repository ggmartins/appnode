#!/bin/sh

USERNAME=ggmartins
cd seattle; docker build -t $USERNAME/seattle_armhf .; cd -
cd bismark; docker build -t $USERNAME/bismark_armhf .; cd -
