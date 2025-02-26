Tenmperaturas = randi([0, 10000], 10);

tic;
ordenadoHeap = heapsort(Tenmperaturas);
timeHeap = toc;

tic;
ordenadoRadix = radixSort(Tenmperaturas);
timeRadix = toc;


fprintf('Tiempo de ejecucion de HeapSort: %f segundos\n', timeHeap);
fprintf('Tiempo de ejecucion de RadixSort: %f segundos\n', timeRadix);