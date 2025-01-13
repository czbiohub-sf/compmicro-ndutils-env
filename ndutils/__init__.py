from . import _version


# The "_version.py" file is generated by setuptools_scm on installation


def env_version():
    package, version = _env_version_tuple()
    print(f"{package}\t{version}")


def _env_version_tuple():
    package = __name__
    return (package, _version.version)