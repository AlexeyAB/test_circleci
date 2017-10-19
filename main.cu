#include <stdio.h>	// printf(); gets();
#include <stdlib.h>	// malloc();
#include <math.h>	// sqrt();

__global__	// execute on GPU
void calculation(int size, float *y) 
{
	int i = blockIdx.x*blockDim.x + threadIdx.x;
	if (i < size) y[i] = sqrt( y[i] );
}

// execute on CPU
int main(void) {
	int size = 1000000;		// 1M elements
	float *array_cpu_ptr;
	cudaSetDeviceFlags(cudaDeviceMapHost);
	cudaHostAlloc(&array_cpu_ptr, size*sizeof(float), 
			cudaHostAllocMapped);
	float *array_ptr;		// UVA pointer
	cudaHostGetDevicePointer(&array_ptr, array_cpu_ptr, 0);

	// Init array
	for (int i = 0; i < size; i++) array_ptr[i] = 2.0f;

	int blocks_num = size/256 + 1;
	int threads_num = 256;

	// execute on GPU
	calculation<<<blocks_num, threads_num>>>(size, array_ptr);

	// CPU waiting for completion of GPU execution
	cudaDeviceSynchronize(); 
	printf("array_ptr[10]: %f \n", array_ptr[10]);
	cudaFreeHost(array_cpu_ptr);
	cudaDeviceReset();		// reset current device
	return 0;
}
