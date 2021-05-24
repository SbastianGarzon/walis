FROM rocker/shiny

RUN apt-get update && apt-get install -y \
	sudo\
	python3.6\
	python3-pip

RUN pip install --no-cache-dir notebook==5.*
RUN pip install --no-cache-dir jupyterhub

RUN Rscript install.R

