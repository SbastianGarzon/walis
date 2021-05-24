FROM rocker/shiny:4.1.0

RUN apt-get update && apt-get install -y \
	software-properties-common

RUN apt-get update

# Install required libraryes including GDAL development libraries
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    lbzip2 \
    libfftw3-dev \
    libgdal-dev \
    libgeos-dev \
    libgsl0-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libhdf4-alt-dev \
    libhdf5-dev \
    libjq-dev \
    libpq-dev \
    libproj-dev \
    libprotobuf-dev \
    libnetcdf-dev \
    libsqlite3-dev \
    libssl-dev \
    libudunits2-dev \
    netcdf-bin \
    postgis \
    protobuf-compiler \
    sqlite3 \
    tk-dev \
    unixodbc-dev\
    sudo\
    python3-pip

RUN install2.r --error \
    proj4 \
    raster \
    rgdal \
    rgeos \
    sf \
    sp

RUN pip install --no-cache-dir notebook==5.*
RUN pip install --no-cache-dir jupyterhub

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}

RUN Rscript install.R






