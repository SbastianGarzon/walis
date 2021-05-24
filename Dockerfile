FROM rocker/geospatial:4.1.0

RUN apt-get update && apt-get install -y \
	sudo\
	python3.6\
	python3-pip

RUN pip install --no-cache-dir notebook==5.*
RUN pip install --no-cache-dir jupyterhub

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

RUN Rscript install.R

