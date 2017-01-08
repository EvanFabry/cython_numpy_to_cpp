#include "c_func.h"
#include <stdio.h>

int c_func( int N, const double a[], double z[] )
{
    printf( "input: N=%d a[0]=%f \n", N, a[0] );
    for( int j = 0;  j < N;  j ++ ){
        z[j] = a[j] * a[j];
    }
    return N;
}