OpenMP_HelloWorld : main.o
	gcc -lm -O3 -lgomp -o OpenMP_HelloWorld main.o
		 

gcc = gcc -O3 -fopenmp -c

main.o : main.c
	$(gcc) main.c


clean : 
	rm main.o
