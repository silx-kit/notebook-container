FROM jupyter/scipy-notebook

USER root

# check and install new software updates
RUN apt-get update -y
RUN apt-get -yy upgrade

# install dependecies required for building
RUN apt-get install -y \
  python3-opengl \
  python3-pyqt5.qtopengl \
  python3-pyqt5.qtsvg \
  python3-six \
  cmake cmake-curses-gui build-essential g++ \
  bison flex freeglut3 freeglut3-dev libxi6 \
  libxi-dev libxmu6 libxmu-dev libxmu-headers \
  less wget &&\
  apt-get clean				

# Switch to the user's UID to avoid permission errors
USER $NB_UID
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
	pillow \
	plotly \
	pybind11 \
	pyFAI \
	pyFFTW \
	pymca \
	pythran \
	pythreejs \
	widgetsnbextension \
	xrayutilities 
