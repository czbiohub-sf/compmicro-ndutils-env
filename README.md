# compmicro-ndutils-env
This repo contains an environment definition and automated build for Comp Micro's "ndutils" environment for analysis of N-dimensional microscopy data.

## Installation from release
See releases at https://github.com/czbiohub-sf/compmicro-ndutils-env/releases.

### Pip
```
python3 -m pip install https://github.com/czbiohub-sf/compmicro-ndutils-env/releases/download/v${RELEASE_VERSION}/ndutils-${RELEASE_VERSION}-py3-none-any.whl
```

### Conda
```
conda install https://github.com/czbiohub-sf/compmicro-ndutils-env/releases/download/v{RELEASE_VERSION}/ndutils-${RELEASE_VERSION}-py_0.conda
```

### Docker
A docker image is automatically built using GitHub actions whenever a version tag is pushed. See the GitHub-hosted [compmicro-ndutils-env](https://github.com/czbiohub-sf/compmicro-ndutils-env/pkgs/container/compmicro-ndutils-env) Docker repository.

To pull and run a Docker image:
```
docker run ghcr.io/czbiohub-sf/compmicro-ndutils-env:v${RELEASE_VERSION}
```

### Building from source
````
git clone git@github.com:czbiohub-sf/compmicro-ndutils-env.git
cd compmicro-ndutils-env
pip-compile  # Builds requirements.txt. Requires pip-tools.
pip install .
conda build .
docker build .
```

## Apptainer
To run an Apptainer container created from the Docker image:
```
apptainer run docker://ghcr.io/czbiohub-sf/compmicro-ndutils-env:v${RELEASE_VERSION}
```

Or to run a bash shell in Apptainer:
```
apptainer exec docker://ghcr.io/czbiohub-sf/compmicro-ndutils-env:$v{RELEASE_VERSION} bash
```

## Checking the installed version
You can check the version of the installed ndutils environment using the env_version command or with "pip list" or "pip show".

```
$ env_version
ndutils 0.2.0.dev3

$ pip list | grep ndutils
ndutils         0.2.0.dev3

$ pip show ndutils
Name: ndutils
Version: 0.2.0.dev3
Summary: ndutils compute environment for computational microscopy at CZBiohub SF
...
```

## Creating a new release
To update this environment:
* Check out the git repo and make edits
  * Update top-level Python dependencies by editing requirements.in
* Commit and push/merge changes to the *main* branch
* Tag the commit with a version identifier (`git tag vX.Y.Z`)
* Push the tag with `git push --tags` (warning this pushes ALL local tags)
* Monitor [GitHub actions](https://github.com/czbiohub-sf/compmicro-ndutils-env/actions) to confirm the build succeeds
* If needed, deploy the new environment to your infrastructure (e.g. by running "conda update ...".) Deployment documentation is not included here as it varies between sites.

## Creating a new environment
If you want to use the code in this repo as a template for creating a new environment, you will need to make the following changes:
* Create a new repo in GitHub. (Defining multiple environments in one GitHub repo is to be avoided because it complicates versioning and automatically building each environment separately.)
* When copying files into the new repo, be sure to include the hidden ".github/" directory and ".gitignore" file, but exclude the ".git/" directory. (A fresh ".git" directory will be creating either by `git init` or by cloning a clean repo created in GitHub.)
* Edit the following files and directories to update references to the git repo name (compmicro-ndutils-env), Python package name and conda environment name (ndutils), environment name. (You may want to grep to make sure there are not any others.)
  * README.md
  * pyproject.toml
  * ndutils/
* Edit the Dockerfile to ensure an appropriate ENTRYPOINT is used, if any, for the new environment.
* Commit, tag, and push the updated code as described in "Creating a new release".
