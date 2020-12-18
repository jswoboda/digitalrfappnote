sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
# UHD Setup
sudo apt-get install libboost-all-dev libusb-1.0-0-dev doxygen python3-docutils python3-mako python3-numpy python3-requests python3-ruamel.yaml python3-setuptools cmake build-essential git
mkdir Python
cd Python
git clone https://github.com/EttusResearch/uhd.git
cd uhd
git checkout v4.0.0.0
cd host
mkdir build
cd build
cmake ../
make
sudo make install

#GNU Radio Set Up
cd ../../../
sudo apt install git cmake g++ libboost-all-dev libgmp-dev swig python3-numpy \
python3-mako python3-sphinx python3-lxml doxygen libfftw3-dev \
libsdl1.2-dev libgsl-dev libqwt-qt5-dev libqt5opengl5-dev python3-pyqt5 \
liblog4cpp5-dev libzmq3-dev python3-yaml python3-click python3-click-plugins \
python3-zmq python3-scipy python3-gi python3-gi-cairo gobject-introspection gir1.2-gtk-3.0
# If doing gnuradio 3.9
#sudo apt install pybind11-dev python3-matplotlib libsndfile1-dev
git clone --recursive https://github.com/gnuradio/volk.git
cd volk
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 ../
make
sudo make install
sudo ldconfig

cd ~/Python
git clone https://github.com/gnuradio/gnuradio.git
cd gnuradio
git checkout maint-3.8
git submodule update --init --recursive
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 ../
make -j3
sudo make install
sudo ldconfig

#Digital RF Set up
cd ~/Python
sudo apt install python3-pip
pip3 install sounddevice
sudo apt install libhdf5-dev python3-pkgconfig python3-setuptools python3-h5py \
python3-packaging python3-dateutil python3-tz python3-uhd python3-matplotlib \
python3-pandas python3-pandas python3-watchdog
git clone https://github.com/MITHaystack/digital_rf.git
cd digital_rf
mkdir build
cd build
cmake -DPython_EXECUTABLE=/usr/bin/python3 ..
make
sudo make install
sudo ldconfig
