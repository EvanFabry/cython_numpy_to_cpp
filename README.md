# cython_numpy_to_cpp
A basic working example of python transferring a NumPy array to C++ and back

Use:

Define a C++ function in c_func.h and c_func.cpp.
This will be called from func.pyx.
Run build.sh to build the resulting cython function.
Run the test file, test_func.py.


Misc.:

clean.sh will remove all artifacts of previous builds.

build-osx.sh demonstrates how to build using clang after
installing via "brew install llvm".