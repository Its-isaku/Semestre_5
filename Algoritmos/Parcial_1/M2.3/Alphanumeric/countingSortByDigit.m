function sortedArray = countingSortByDigit(array, exp)
    n = length(array);
    output = cell(1, n); % Usamos cell array para manejar datos mixtos
    count = zeros(1, 256); % Usamos 256 para cubrir todos los caracteres ASCII

    % Contar ocurrencias del carácter o dígito actual
    for i = 1:n
        % Convertir el elemento a cadena para manejar números y letras
        str = string(array(i));
        if exp <= strlength(str)
            charCode = double(str{1}(exp)); % Obtener el código ASCII del carácter
        else
            charCode = 0; % Si la cadena es más corta, tratarla como 0
        end
        count(charCode + 1) = count(charCode + 1) + 1;
    end

    % Actualizar las posiciones de los caracteres o dígitos
    for i = 2:256
        count(i) = count(i) + count(i-1);
    end

    % Construir el arreglo ordenado
    for i = n:-1:1
        str = string(array(i));
        if exp <= strlength(str)
            charCode = double(str{1}(exp));
        else
            charCode = 0;
        end
        output{count(charCode + 1)} = array(i);
        count(charCode + 1) = count(charCode + 1) - 1;
    end

    sortedArray = output;
end