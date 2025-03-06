% Ordenar números
numeros = [3, 1, 2];
sortedNumeros = radixSort(numeros);
disp(sortedNumeros); % Salida: ["1", "2", "3"]

% Ordenar letras
letras = ["b", "a", "c"];
sortedLetras = radixSort(letras);
disp(sortedLetras); % Salida: ["a", "b", "c"]

% Ordenar datos mixtos
mixtos = ["a1", "b2", "a3"];
sortedMixtos = radixSort(mixtos);
disp(sortedMixtos); % Salida: ["a1", "a3", "b2"]