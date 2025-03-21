% Matriz del grafo
matriz = [
%   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q
    0   2   2   2   0   0   0   0   0   0   0   0   0   0   0   0   0; % A
    2   0   2   0   0   0   4   0   0   0   2   0   0   0   0   0   0; % B
    2   2   0   2   2   3   0   0   0   0   3   0   0   0   0   0   0; % C
    2   0   2   0   0   0   0   0   0   9   0   0   0   0   0   0   0; % D
    0   0   2   0   0   1   0   0   0   3   0   0   0   0   0   0   0; % E
    0   0   3   0   1   0   5   1   5   5   0   0   0   0   0   0   0; % F
    0   4   0   0   0   5   0   2   0   0   2   9   0   0   0   0   0; % G
    0   0   0   0   0   1   2   0   2   0   0   0   0   0   0   0   0; % H
    0   0   0   0   0   5   0   2   0   8   0   9   0   8   7   0   0; % I
    0   0   7   9   3   5   0   0   8   0   0   0   0   0  10   0   0; % J
    0   2   3   0   0   0   2   0   0   0   0   0   0   0   0   0   0; % 4(K)
    0   0   0   0   0   0   9   0   0   0   0   0   8   0   0   0   0; % L
    0   0   0   0   0   0   0   0   0   0   0   8   0   9   0   0  15; % M
    0   0   0   0   0   0   0   0   8   0   0   0   9   0   0   3   9; % N
    0   0   0   0   0   0   0   0   7  10   0   0   0   0   0   8   0; % O
    0   0   0   0   0   0   0   0   0   0   0   0   0   3   8   0   5; % P
    0   0   0   0   0   0   0   0   0   0   0   0  15   9   0   5   0  % Q
];

% Aplicando algoritmo de Prim
disp('<-------- ALgoritmo Prim -------->');
tic;
prim_algorithm(matriz);
TiempoPrim = toc;
fprintf('Tiempo de algoritmo Prim: %d \n', TiempoPrim)

% Aplicando algoritmo de Kruskal
disp('<-------- ALgoritmo Kruskal -------->');
tic;
kruskal_algorithm(matriz);
TiempoKruskal = toc;
fprintf('Tiempo de algoritmo kruskal: %d \n', TiempoKruskal)