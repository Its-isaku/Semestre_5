function sortedArray = quickSort2D(array)
    if size(array, 1) <= 1
        sortedArray = array;
    else
        pivot = array(1, 1); % Usamos la primera columna (x) como pivote
        left = array(array(:, 1) < pivot, :); % Filas donde x < pivote
        right = array(array(:, 1) > pivot, :); % Filas donde x > pivote
        sortedArray = [quickSort2D(left); array(array(:, 1) == pivot, :); quickSort2D(right)];
    end
end