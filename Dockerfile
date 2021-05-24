FROM rocker/geospatial

USER root
COPY . ${HOME}
RUN Rscript install.R
