# Digital RF
The draft app-note for Digital RF


## Abstract

This application note details the open source package Digital RF. This software product contains tools to use the formats Digital RF and Digital Metadata which can be used store RF voltage data and its associated metadata. First showing 

## Format

Block-oriented format and namespace
Time → Channel → Subchannel → Samples
Indexed by number of samples from Unix epoch (Jan. 1, 1970)
Data saved within HDF5 files for long-term portability
File structure is optimized for quick API retrieval of specific RF samples
Metadata is saved along with RF
Digital metadata is saved synchronously with each RF voltage file
HDF5 format ensures long term portability and metadata retrieval
Tree structure of time-indexed data objects 


## Install Instructions

If you're just getting started with Digital RF, we recommend using the Python package. The easiest way to install it is through PyPI_ with `pip`::

    pip install digital_rf

This will install the ``digital_rf`` and ``gr_digital_rf`` Python packages and GNU Radio Companion (GRC) blocks. If you're interested in the C library or development, see below for ways to install the full project package.

If you plan on using Digital RF with GNU Radio, make sure to run the `pip` command in the same Python environment that your GNU Radio installation uses so that GNU Radio can find the packages. Depending on your GNU Radio installation, it may be necessary to add the Digital RF blocks to your GRC blocks path by creating or editing the GRC configuration file



|    <!-- -->     |  <!-- -->                  |
|-----------------|----------------------------|
| **Unix (local):** | $HOME/.gnuradio/config.conf |
|**Windows (local):** | %APPDATA%/.gnuradio/config.conf|
|**Unix (global):** | /etc/gnuradio/conf.d/grc.conf|
|**Custom (global):** | {INSTALL_PREFIX}/etc/gnuradio/conf.d/grc.conf|


to contain::

    [grc]
    local_blocks_path = {PIP_PREFIX}/share/gnuradio/grc/blocks
    
(replacing ``{PIP_PREFIX}`` with the pip installation prefix, "/usr/local" for example).

### Using Conda package

Alternatively, you can install digital_rf using our Conda_ binary package. It is available in the `conda-forge <https://conda-forge.github.io/>`_ distribution of community-maintained packages.

In an existing Conda environment, run the following to install ``digital_rf`` and its dependencies::

    conda config --add channels conda-forge
    conda config --set channel_priority strict
    conda install digital_rf

You may also want to install the ``gnuradio-core`` package in order to make use of ``gr_digital_rf``::

    conda install gnuradio-core

### Using MacPorts

Digital RF can be installed though MacPorts, using the port install command::

    sudo ports install digital_rf

This will install and build all of the needed dependencies using MacPorts.

### Using source code package

First, ensure that you have the above-listed dependencies installed.

Clone the repository and enter the source directory::

    git clone https://github.com/MITHaystack/digital_rf.git
    cd digital_rf

Create a build directory to keep the source tree clean::

    mkdir build
    cd build

Build and install::

    cmake ..
    make
    sudo make install

CMake will attempt to find your Python installation in the usual places, preferring Python 3. If this fails or you need to specify a Python 2 installation (e.g. for GNU Radio older than version 3.8), specify a particular Python interpreter by adding ``-DPython_EXECUTABLE={PATH}`` (replacing ``{PATH}`` with the interpreter path) to the cmake command.

Finally, you may need to update the library cache so the newly-installed ``libdigital_rf`` is found::

    sudo ldconfig

Note that it is also possible to build the different language libraries separately by following the CMake build procedure from within the `c`, `matlab`, and `python` directories.


The MATLAB toolbox is not created by default. If you have MATLAB R2016a or higher and want to create an installable toolbox package, run the following from the build directory::

    make matlab

The toolbox package will then be found at "build/matlab/digital_rf.mltbx".

## Example Usage

Python and C examples can be found in the examples directory in the source tree. The C examples can be compiled from the build directory by running::

    make examples


The following Python commands will load and read data located in a directory "/data/test".

Load the module and create a reader object::

    import digital_rf as drf
    do = drf.DigitalRFReader('/data/test')

List channels::

    do.get_channels()

Get data bounds for channel 'cha'::

    s, e = do.get_bounds('cha')

Read first 10 samples from channel 'cha'::

    data = do.read_vector(s, 10, 'cha')


## Basic Recording and Transmitting with USRPs


## Example 2

We have another example.
