import numpy as np
cimport numpy as np

cdef extern from "c_func.h": 
    int c_func( int N, double* a, double* z )  # z = a * a

def fpy( N,
    np.ndarray[np.double_t,ndim=1] A,
    np.ndarray[np.double_t,ndim=1] Z ):
    """ wrap np arrays to fc( a.data ... ) """
    assert N <= len(A) == len(Z)
    out = c_func( N, <double*> A.data, <double*> Z.data )
    return out
