FROM continuumio/miniconda
WORKDIR /usr/src

# Create a conda environment from environment.yml
COPY environment.yml .
RUN conda env create -f environment.yml

# Make RUN commands use the new environment
SHELL ["conda", "run", "-n", "ndutils-env", "/bin/bash", "-c"]

# Set ENV_VERSION to the corresponding git commit, tag, or branch
ARG ENV_VERSION
ENV ENV_VERSION=$ENV_VERSION
