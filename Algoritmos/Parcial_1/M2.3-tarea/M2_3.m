% 1. Generar una matriz numérica aleatoria
matriz = randi([-600, 600], 10, 10);  % Matriz 10x10 con valores entre -600 y 600

% 2. Aplicar la función de Griewangk a cada fila de la matriz
resultados = zeros(size(matriz, 1), 1);  % Vector para almacenar los resultados
for i = 1:size(matriz, 1)
    resultados(i) = griewangk(matriz(i, :));
end

% 3. Mostrar los números sin ordenar
disp('Resultados de la función de Griewangk (sin ordenar):');
disp(resultados);

% 4. Ordenar los resultados usando Heapsort y medir el tiempo
tic;
ordenadoHeap = heapsort(resultados);
timeHeap = toc;

% 5. Ordenar los resultados usando Radixsort y medir el tiempo
tic;
ordenadoRadix = radixSort(resultados);
timeRadix = toc;

% 6. Mostrar los tiempos de ejecución
fprintf('Tiempo de ejecución de HeapSort: %f segundos\n', timeHeap);
fprintf('Tiempo de ejecución de RadixSort: %f segundos\n', timeRadix);