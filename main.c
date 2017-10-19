#include <stdio.h> 	/* printf() */
#include "omp.h"
 
int main(int argc, char* argv[]) 
{ 
	#pragma omp parallel
	printf ("\n Hello, World from thread %3d of %3d \n\n", 
		omp_get_thread_num(), omp_get_num_threads()); 

	return 0; 
}
