PACKAGE_NAME := ndutils

.PHONY: install
install:
	pip install -e ".[dev]"
	pre-commit install

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

.PHONY: deploy
deploy:
	module load anaconda comp_micro
	conda env update --file environment.yml --prefix /hpc/user_apps/comp_micro/conda_envs/$(PACKAGE_NAME)
