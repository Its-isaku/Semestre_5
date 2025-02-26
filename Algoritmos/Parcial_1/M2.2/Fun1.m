% Practicas M2.2

n = 2; % Numero de dimensiones
num_Puntos = 100; % Número de puntos

% Generar numeros aleatorios en el dominio entre [-5.12, 5.12]
num_aleatorios = -5.12 + (5.12 + 5.12) * rand(num_Puntos, n);

% Evaluo la funcion de "De Jong" con los numeros aleatorios 
Fun_De_Jong = sum(num_aleatorios.^2, 2);

% Ordenar los datos usando QuickSort (basado en la primera columna x)
num_quickSort = quickSort2D(num_aleatorios); % Usamos una versión 2D de QuickSort
valores_quickSort = sum(num_quickSort.^2, 2);

% Ordenar los datos usando MergeSort (basado en la primera columna x)
num_mergeSort = mergeSort2D(num_aleatorios); % Usamos una versión 2D de MergeSort
valores_mergeSort = sum(num_mergeSort.^2, 2);

% Crear una malla (grid) para la superficie
[x, y] = meshgrid(-5.12:0.1:5.12, -5.12:0.1:5.12); % Rango y paso adecuados
z = x.^2 + y.^2; % Función de De Jong en 2D

% Crear una figura para las gráficas
figure;

% Gráfica antes de ordenar (superficie + puntos)
subplot(3,1,1);
surf(x, y, z, 'EdgeColor', 'none'); % Superficie de la función de De Jong
hold on;
plot3(num_aleatorios(:, 1), num_aleatorios(:, 2), Fun_De_Jong, 'ko'); % Puntos negros
title('Valores de la función de De Jong (Antes de ordenar)');
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
grid on;
colormap jet; % Mejora la visualización de la superficie
colorbar; % Muestra la barra de colores
hold off;

% Gráfica después de ordenar con Quicksort (superficie + puntos)
subplot(3,1,2);
surf(x, y, z, 'EdgeColor', 'none'); % Superficie de la función de De Jong
hold on;
plot3(num_quickSort(:, 1), num_quickSort(:, 2), valores_quickSort, 'bo'); % Puntos azules
title('Valores de la función de De Jong (Después de Quicksort)');
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
grid on;
colormap jet;
colorbar;
hold off;

% Gráfica después de ordenar con Mergesort (superficie + puntos)
subplot(3,1,3);
surf(x, y, z, 'EdgeColor', 'none'); % Superficie de la función de De Jong
hold on;
plot3(num_mergeSort(:, 1), num_mergeSort(:, 2), valores_mergeSort, 'ro'); % Puntos rojos
title('Valores de la función de De Jong (Después de Mergesort)');
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
grid on;
colormap jet;
colorbar;
hold off;

% Asegurarse de que las gráficas se muestren
drawnow; % Fuerza a MATLAB a actualizar la figura