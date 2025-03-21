% probema de la red de distribucion de energia
G_energia = [
 0 10 0 15 0;
 10 0 20 5 0;
 0 20 0 0 8;
 15 5 0 0 12;
 0 0 8 12 0;
];


G_selected_edges = [
    1 2;
    2 4;
    4 5;
    5 3
];

plot_tree(G_energia, Selected_edges_G)

disp('Grafo de la red de distribucion de energia: ');
disp(G_energia);

tic;
disp('Resultado utilizando el algoritmo de Prim: ');
prim_algorithm(G_energia);
G_PrimTime = toc;

tic;
disp('Resultado utilizando el algoritmo de Krustal: ');
prim_algorithm(G_energia);
G_KrustalTime = toc;

fprintf('Tiempor de Prim con G_Energia %d \n' , G_PrimTime)
fprintf('Tiempor de Krustal con G_Energia %d \n' , G_KrustalTime)


disp('<-----------------------Practica 2----------------------->')

% probema de la red de distribucion de agua
G_agua = [
    0 10 6 2 0 0; %1
    10 0 0 7 0 0; %2 
     6 0 0 8 0 0; %3
     2 7 8 0 5 9; %4
     0 0 0 5 0 15;%5
     0 0 0 9 15 0 %6
    
];


A_selected_edges = [
    1 4;
    4 5;
    1 3;
    2 4;
    3 4
];

plot_tree(G_agua,A_selected_edges);


disp('Grafo de la red de distribucion de agua: ');
disp(G_agua);


tic;
disp('Resultado utilizando el algoritmo de Prim: ');
prim_algorithm(G_agua);
A_PrimTime = toc;

tic;
disp('Resultado utilizando el algoritmo de Krustal: ');
prim_algorithm(G_agua);
A_KrustalTime = toc;

fprintf('Tiempor de Prim con G_Energia %d \n' , A_PrimTime)
fprintf('Tiempor de Krustal con G_Energia %d \n' , A_KrustalTime)

