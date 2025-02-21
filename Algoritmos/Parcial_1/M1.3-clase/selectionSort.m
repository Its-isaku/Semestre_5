function sortedArray = selectionSort(array)
    % selectionSort Ordena un arreglo usando el algoritmo de selección.
    %   sortedArray = selectionSort(array) devuelve el arreglo ordenado de menor a mayor.
    
    n = length(array); % Obtiene la longitud del arreglo
    
    for i = 1:n-1
        % Supone que el primer elemento no ordenado es el mínimo
        minIndex = i;
        
        % Encuentra el índice del elemento mínimo en la sublista no ordenada
        for j = i+1:n
            if array(j) < array(minIndex)
                minIndex = j;
            end
        end
        
        % Intercambia el elemento mínimo encontrado con el primer elemento no ordenado
        if minIndex ~= i
            temp = array(i);
            array(i) = array(minIndex);
            array(minIndex) = temp;
        end
    end
    
    sortedArray = array; % Devuelve el arreglo ordenado
end