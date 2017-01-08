import numpy as np
cimport numpy as np

cdef extern from "c_func.h": 
    int c_func( int N, double* a, double* z )  # z = a * a

def fpy_1d(np.ndarray[np.double_t, ndim=1] X):
    """ 
    Wraps a call to a funcition in C++ of header type void/int/etc f(int N, int* A, int* B).
    N is the number of elements in A and B, A is a numpy array passed from python, and B is 
    a numpy array with values modified in C++ to be returned to the calling python program.
    """
    X = np.ascontiguousarray(X)
    # create output array in contiguous memory ("c")
    cdef np.ndarray[np.double_t, ndim=1, mode="c"] Y = np.zeros_like(X)

    # pass the addresses of the beginning of each array.
    # this is possible because they are contiguous
    cdef int size = X.shape[0]
    c_func(size, &X[0], &Y[0])
    return Y

def fpy_2d(np.ndarray[np.double_t, ndim=2] X):
    """ wrap np arrays to fc( a.data ... ) """
    X = np.ascontiguousarray(X)
    cdef np.ndarray[np.double_t, ndim=2, mode="c"] Y = np.zeros_like(X)

    cdef int size = X.shape[0] * X.shape[1]
    c_func(size, &X[0, 0], &Y[0, 0])
    return Y
