PACKAGE_NAME := ndutils

# TODO: add update which will git fetch and pull the latest tag:
# https://stackoverflow.com/questions/17414104/git-checkout-latest-tag

# install in dev mode and make sure to install pre-commit hooks too
.PHONY: install
install:
	pip install -e ".[dev]"
	pre-commit install

# run pip-compile with correct options
# TODO: install pip-tools only if needed?
.PHONY: compile
compile:
	pip install pip-tools
	pip-compile --no-emit-options --upgrade --no-strip-extras

# run the pre-commit hooks on all files (not just staged changes)
# (requires pre-commit to be installed)
.PHONY: pre-commit
pre-commit:
	pre-commit run --all-files

.PHONY: test
test:
	python3 -m unittest discover

# Deploy on bruno (i.e. update conda environment)
# TODO: use conda env create if the environment does not exist?
.PHONY: bruno
bruno:
	module load anaconda comp_micro
	conda env update --file environment.yml --prefix /hpc/user_apps/comp_micro/conda_envs/$(PACKAGE_NAME)
