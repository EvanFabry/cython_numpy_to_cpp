#!/usr/bin/env python
# test-f.py

import numpy as np
import func  # loads f.so from cc-lib: f.pyx -> f.c + fc.o -> f.so

N = 30
a = np.arange(N, dtype=np.float64)

out = func.fpy_1d(a)
print ("fpy_1d -> fc z:", out)

out = func.fpy_2d(a.reshape((N // 2, 2)))
print ("fpy_2d -> fc z:", out)
