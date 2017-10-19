SimpleCudaC : main.o
	nvcc -O3 -arch=sm_20 -lcuda -o  SimpleCudaC main.o
		 

nvcc = nvcc --machine 64 -O3 -arch=sm_30 -c

main.o : main.cu
	$(nvcc) main.cu


clean : 
	rm main.o