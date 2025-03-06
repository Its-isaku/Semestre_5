Tiempo = [4; 2; 5; 7];
Valor = [10; 8; 6; 12];

TiempoOrdenado = quickSort(Tiempo);
ValorOrdenado = quickSort(Valor);

disp('Seleccion de orden Decresiente para tiempo maximo');
suma = 0; 
rango = 10;
valoresDecTiempo = [];

for i = length(TiempoOrdenado):-1:1
    if suma + TiempoOrdenado(i) <= rango  
        suma = suma + TiempoOrdenado(i);
        valoresDecTiempo(end+1) = TiempoOrdenado(i);
    end
end

disp(['Suma final: ', num2str(suma)]);
disp('Valores sumados:');
disp(valoresDecTiempo);


disp('Seleccion de orden Cresiente para tiempo maximo')
for i = 1 : length(TiempoOrdenado)
    rango = 10;
end


disp('Seleccion de orden Decresiente para valor maximo')
suma = 0; 
rango = 30;

for i = length(ValorOrdenado):-1:1
    if suma + ValorOrdenado(i) <= rango  
        suma = suma + ValorOrdenado(i);
    end
end

disp(['Suma final: ', num2str(suma)]);


disp('Seleccion de orden Creciente para valor maximo')
for i = 1 : length(ValorOrdenado)
    rango = 10;
end
