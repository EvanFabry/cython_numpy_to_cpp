import numpy
from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
from Cython.Build import cythonize

ext_modules = [
    Extension(
        name="func",
        sources=["func.pyx", "c_func.cpp"],
        # extra_compile_args=["-O3", "-ffast-math", "-march=native", "-fopenmp" ],
        # extra_link_args=['-fopenmp'],
        # extra_compile_args=["-O3", "-ffast-math", "-march=native", "-g", "-pthread" ],
        # extra_link_args=['-pthread'],
        language="c++",
        include_dirs=[numpy.get_include()],
    )
]

setup(
    name='func',
    cmdclass = {'build_ext': build_ext},
    ext_modules=cythonize(ext_modules),
)