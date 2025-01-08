from . import _version

def version():
    print(f"{__name__} version:")
    print(_version.version)
