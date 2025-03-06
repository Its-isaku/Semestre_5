function sortedArray = countingSortByDigit(array, exp)
    n = length(array);
    output = zeros(1, n);
    count = zeros(1, 10);
    
    % Contar ocurrencias del dígito actual
    for i = 1:n
        digit = floor(array(i)/exp) - floor(array(i)/(exp*10)) * 10;
        count(digit + 1) = count(digit + 1) + 1;
    end
    
    % Actualizar las posiciones de los dígitos
    for i = 2:10
        count(i) = count(i) + count(i-1);
    end
    
    % Construir el arreglo ordenado
    for i = n:-1:1
        digit = floor(array(i)/exp) - floor(array(i)/(exp*10)) * 10;
        output(count(digit + 1)) = array(i);
        count(digit + 1) = count(digit + 1) - 1;
    end
    
    sortedArray = output;
end