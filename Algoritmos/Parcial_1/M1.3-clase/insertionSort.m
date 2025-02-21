function sortedArray = insertionSort(arr)
% insertionSort Ordena un arreglo utilizando el algoritmo de inserción
%   sortedArray = insertionSort(arr) devuelve una versión ordenada del
%   arreglo de entrada 'arr' en orden ascendente.
%
%   Parámetros de entrada:
%       arr - Arreglo numérico desordenado (vector fila o columna)
%
%   Parámetros de salida:
%       sortedArray - Arreglo ordenado en orden ascendente

    % Copiar el arreglo de entrada para evitar modificar el original
    sortedArray = arr;
    n = length(sortedArray);
    
    % Iterar desde el segundo elemento hasta el final del arreglo
    for i = 2:n
        key = sortedArray(i);    % Elemento a insertar
        j = i - 1;
        
        % Mover los elementos mayores que 'key' una posición hacia la derecha
        while j >= 1 && sortedArray(j) > key
            sortedArray(j + 1) = sortedArray(j);
            j = j - 1;
        end
        % Insertar el elemento en la posición correcta
        sortedArray(j + 1) = key;
    end
end