function sortedArray = heapSort(array)
    n = length(array);
    
    % Construir el Max-Heap
    for i = floor(n/2):-1:1
        array = heapify(array, n, i);
    end
    
    % Extraer elementos del heap
    for i = n:-1:2
        % Intercambiar el elemento máximo con el último elemento
        array([1 i]) = array([i 1]);
        
        % Volver a aplicar heapify para mantener la propiedad del heap
        array = heapify(array, i-1, 1);
    end
    
    sortedArray = array;
end