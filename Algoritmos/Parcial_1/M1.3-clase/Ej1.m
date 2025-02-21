
a = randi([0,20],2,5)
b = randi([0,20],2,5)
c = randi([0,20],2,5)

%% Operaciones con matrices
%% Suma A + B

suma = a + b + c

%% 

tic
Insercion1 = insertionSort([suma])
Time1 = toc

tic
Insercion2 = bubbleSort([suma])
Time2 = toc

tic
Insercion3 = mergeSort([suma])
Time3 = toc

tic
Insercion4 = quickSort([suma])
Time4 = toc

tic
Insercion5 = selectionSort([suma])
Time5 = toc

tic
Insercion6 = shellSort([suma])
Time6 = toc

fprintf("tiempo ejecucion %f inserccion \n",Time1);
fprintf("tiempo ejecucion %f bubble \n",Time2);
fprintf("tiempo ejecucion %f merge \n" ,Time3);
fprintf("tiempo ejecucion %f quicksort \n",Time4);
fprintf("tiempo ejecucion %f selectionsort\n",Time5);
fprintf("tiempo ejecucion %f shellsort\n",Time6);
