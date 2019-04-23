FROM jupyter/scipy-notebook

USER root

# check and install new software updates
RUN apt-get update -y
RUN apt-get -yy upgrade

# install dependecies required for building
RUN apt-get install -y \
  python3-opengl python3-venv\
  python3-pyqt5.qtopengl \
  python3-pyqt5.qtsvg python3-venv\
  python3-six pocl-opencl-icd clinfo ocl-icd-opencl-dev\
  cmake cmake-curses-gui build-essential g++ \
  bison flex freeglut3 freeglut3-dev libxi6 \
  libxi-dev libxmu6 libxmu-dev libxmu-headers \
  less wget python3-all-dev &&\
  apt-get clean				

# Switch to the user's UID to avoid permission errors
USER $NB_UID
# This is a pre-requist for most packages
RUN python3 -m venv ~/venv
RUN . ~/venv/bin/activate
RUN pip install numpy cython
RUN pip install silx[full] \
  bqplot \
  fabio \
  fisx \
  freesas \
  h5py  \
  h5glance \
  hdf5plugin \
  ipyvolume \
  ipywidgets \
  opencv-python \
  numexpr \
  pillow \
  plotly \
  pybind11 \
  pyFAI \
  pyFFTW \
  pymca \
  pyopencl \
  pythran \
  pythreejs \
  widgetsnbextension \
  xrayutilities 
