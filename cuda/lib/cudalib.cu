#include <cstdio>
#include "data.h"

__constant__ Data d_data;

__global__ void libKernel()
{
    printf("Kernel on main executable -> a: %d, b: %f, c: %f\n", d_data.a, d_data.b, d_data.c);
}

extern "C" void runLibKernel()
{
    libKernel<<<1, 1>>>();
    cudaDeviceSynchronize();
}