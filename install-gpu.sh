#!/bin/bash

set -xe


if ! lspci | grep NVIDIA; then
  exit
fi

apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/cuda.list
#echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list
apt-get update
#apt-get install -y cuda-9-0 libcudnn7
apt-get install -y cuda-drivers