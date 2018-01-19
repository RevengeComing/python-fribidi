from sys import platform

from setuptools import Extension, setup

sources = ['pyfribidi/fribidi.c']
libraries = ['fribidi']

if platform == "linux" or platform == "linux2":
    include_dirs = ['/usr/include/fribidi/']
    library_dirs = ['/usr/include']
elif platform == "darwin":
    library_dirs = ['/usr/local/include']
    include_dirs = ['/usr/local/include/fribidi']


setup(
    name='python-fribidi',
    version='0.1.0',
    description='Python(Cython) Binding for Fribidi The Free Implementation of the Unicode Bidirectional Algorithm.',
    author='Sepehr Hamzehlouy',
    author_email='s.hamzelooy@gmail.com',
    license='MIT',
    url='https://github.com/RevengeComing/python-fribidi',
    packages=['pyfribidi'],
      ext_modules=[Extension(
            name='pyfribidi.fribidi',
            sources=sources,
            libraries=libraries,
            library_dirs=library_dirs,
            include_dirs=include_dirs)
    ],
    include_package_data=True
)