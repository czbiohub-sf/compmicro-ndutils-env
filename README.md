# compmicro-ndutils-env
This repo contains an environment definition and automated build for Comp Micro's "ndutils" environment for analysis of N-dimensional microscopy data.

## Installation
### Pip
The repo is structured as a Python package and can be installed as:
```
python3 -m pip install git+ssh://git@github.com/czbiohub-sf/compmicro-ndutils-env.git
```

### Conda
```
git clone git@github.com:czbiohub-sf/compmicro-ndutils-env.git
conda env create --file compmicro-ndutils-env/environment.yml
```

### Docker
```
git clone git@github.com:czbiohub-sf/compmicro-ndutils-env.git
cd compmicro-ndutils-env
docker build .
```

## Checking the installed version
You can check the version of the installed ndutils environment using the ndutils_version command or with "pip list"
```
$ ndutils_version
0.2.0.dev2

$ pip list | grep ndutils
compmicro-ndutils-env         0.2.0.dev2
```
