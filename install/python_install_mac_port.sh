#!/bin/bash -v

# Python install script for mac
# 	installs all pre-requisite software to run DaViT-py
#	requires MacPort

ver=27

port -n install python${ver}
port -n install mpich +gcc47
port -n install coreutils
easy_install pip
pip install --upgrade numpy
pip install --upgrade matplotlib
port -n install py${ver}-matplotlib-basemap
pip install --upgrade scipy
pip install --upgrade h5py
pip install --upgrade pyzmq tornado pygments
pip install --upgrade ipython
python -c 'from IPython.external import mathjax; mathjax.install_mathjax()'
pip install --upgrade PIL
pip install --upgrade pymongo
pip install --upgrade paramiko
pip install --upgrade jinja2
pip install --upgrade cython
pip install --upgrade scikit-image
pip install --upgrade pandas

dir=$(pwd)
cd /tmp
git clone https://github.com/matplotlib/basemap.git
cd basemap
python2.7 setup.py install


cd $dir
install_dir=$(greadlink -f ../..)
echo "source $install_dir/profile.mac" >> ~/.bash_profile
source ~/.bash_profile

cd ../..
./mastermake
