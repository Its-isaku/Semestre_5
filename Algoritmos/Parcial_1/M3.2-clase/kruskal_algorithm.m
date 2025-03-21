function kruskal_algorithm(G)
    n = size(G, 1); % Número de nodos en el grafo
    edges = []; % Arreglo para almacenar todas las aristas del grafo
    for i = 1:n % Iterar sobre la mitad superior de la matriz de adyacencia para evitar duplicados
        for j = i+1:n
            if G(i, j) > 0 % Si hay una arista entre los nodos i y j
                edges = [edges; i, j, G(i, j)]; % Agregar la arista al arreglo de aristas
            end
        end
    end
    edges = sortrows(edges, 3); % Ordenar las aristas por peso
    parent = 1:n; % Arreglo para mantener el padre de cada nodo
    rank = zeros(1, n); % Arreglo para mantener la altura de cada subárbol
    selected_edges = []; % Arreglo para almacenar las aristas seleccionadas en el árbol de expansión mínima
    while size(selected_edges, 1) < n - 1 % Mientras no hayamos seleccionado n-1 aristas
        edge = edges(1, :); % Tomar la arista con el peso mínimo
        edges(1, :) = []; % Eliminar la arista del arreglo de aristas restantes
        x = find_parent(parent, edge(1)); % Encontrar el padre del nodo x de la arista
        y = find_parent(parent, edge(2)); % Encontrar el padre del nodo y de la arista
        if x ~= y % Si los nodos x e y no están en el mismo conjunto
            selected_edges = [selected_edges; edge]; % Agregar la arista al árbol de expansión mínima
            union_sets(parent, rank, x, y); % Unir los conjuntos de x e y
        end
    end
    disp('Aristas seleccionadas para el árbol de expansión mínima:'); % Mostrar resultado
    disp(selected_edges);
end

function p = find_parent(parent, i)
    if parent(i) ~= i % Si el padre de i no es i mismo
        parent(i) = find_parent(parent, parent(i)); % Actualizar el padre de i recursivamente
    end
    p = parent(i); % Retornar el padre de i
end

function union_sets(parent, rank, x, y)
    x_root = find_parent(parent, x); % Encontrar el padre del nodo x
    y_root = find_parent(parent, y); % Encontrar el padre del nodo y
    if rank(x_root) < rank(y_root) % Si la altura del subárbol de x es menor que la de y
        parent(x_root) = y_root; % Hacer que y sea el padre de x
    elseif rank(x_root) > rank(y_root) % Si la altura del subárbol de x es mayor que la de y
        parent(y_root) = x_root; % Hacer que x sea el padre de y
    else % Si las alturas son iguales
        parent(y_root) = x_root; % Hacer que x sea el padre de y
        rank(x_root) = rank(x_root) + 1; % Incrementar la altura de x
    end
end