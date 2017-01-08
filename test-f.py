#!/usr/bin/env python
# test-f.py

import numpy as np
import func  # loads f.so from cc-lib: f.pyx -> f.c + fc.o -> f.so

N = 30
a = np.arange( N, dtype=np.float64 )
z = np.ones( N, dtype=np.float64 ) * np.NaN

fret = func.fpy( N, a, z )
print ("fpy -> fc z:", z)
