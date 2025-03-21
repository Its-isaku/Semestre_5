function [sortedArray, sortedIndices] = quickSort(array, indices)
    if length(array) <= 1
        sortedArray = array;
        sortedIndices = indices;
    else
        pivot = array(1);
        pivotIndex = indices(1);
        
        % Particionar en izquierda (menores al pivote) y derecha (mayores al pivote)
        left = array(array < pivot);
        right = array(array > pivot);
        
        % Particionar los índices en izquierda y derecha
        leftIndices = indices(array < pivot);
        rightIndices = indices(array > pivot);
        
        % Recursión
        [sortedLeft, sortedLeftIndices] = quickSort(left, leftIndices);
        [sortedRight, sortedRightIndices] = quickSort(right, rightIndices);
        
        % Combinar los resultados
        sortedArray = [sortedLeft, pivot, sortedRight];
        sortedIndices = [sortedLeftIndices, pivotIndex, sortedRightIndices];
    end
end
