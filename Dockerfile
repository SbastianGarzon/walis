FROM rocker/geospatial

USER root
COPY . ${HOME}
RUN R -e "devtools::install_deps()"
