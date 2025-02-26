function sortedArray = radixSort(array)
    % Convertir todos los elementos a cadenas para manejar números y letras
    array = string(array);

    % Encontrar la longitud máxima de las cadenas
    maxLen = max(strlength(array));

    % Ordenar por cada carácter, comenzando desde el último
    for exp = maxLen:-1:1
        array = countingSortByDigit(array, exp);
    end

    sortedArray = array;
end