function prim_algorithm(G)
    n = size(G, 1); % Número de nodos en el grafo
    selected = false(1, n); % Arreglo para almacenar los nodos seleccionados
    selected(1) = true; % Seleccionamos el primer nodo como inicio
    edges = []; % Arreglo para almacenar las aristas seleccionadas
    while sum(selected) < n % Mientras no hayamos seleccionado todos los nodos
        min_weight = Inf; % Peso mínimo inicialmente infinito
        u = 0; % Nodo u de la arista mínima
        v = 0; % Nodo v de la arista mínima
        for i = 1:n % Iterar sobre todos los nodos seleccionados
            if selected(i) % Si el nodo i está seleccionado
                for j = 1:n % Iterar sobre todos los nodos no seleccionados
                    if ~selected(j) && G(i, j) < min_weight && G(i, j) > 0 % Si el nodo j no está seleccionado y el peso de la arista es menor que el mínimo actual
                        min_weight = G(i, j); % Actualizar el peso mínimo
                        u = i; % Actualizar el nodo u
                        v = j; % Actualizar el nodo v
                    end
                end
            end
        end
        edges = [edges; u, v, min_weight]; % Agregar la arista mínima a las aristas seleccionadas
        selected(v) = true; % Seleccionar el nodo v
    end
    disp('Aristas seleccionadas para el árbol de expansión mínima:'); % Mostrar resultado
    disp(edges);
end