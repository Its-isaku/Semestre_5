% Array de cajas con sus pesos
cajas = [50, 80, 25, 65, 35, 40, 30, 65, 55, 22];

% Crear un array de posiciones originales
indicesOriginales = 1:length(cajas);

% Llamar a quickSort modificado para ordenar cajas y obtener los índices originales
[CajasOrdenadas, indicesOrdenados] = quickSort(cajas, indicesOriginales);

% Invertir el orden para obtener de mayor a menor
CajasOrdenadas = flip(CajasOrdenadas);
indicesOrdenados = flip(indicesOrdenados);

% Peso máximo permitido y suma inicial
suma = 0;
PesoMax = 250;

% Array para almacenar qué cajas seleccionamos
cajasSeleccionadas = zeros(size(cajas)); % Inicializar en ceros (ninguna seleccionada)

% Selección de las cajas hasta alcanzar el peso máximo
for i = 1:length(CajasOrdenadas)
    if suma + CajasOrdenadas(i) <= PesoMax
        suma = suma + CajasOrdenadas(i);    % Sumar el peso de la caja
        cajasSeleccionadas(indicesOrdenados(i)) = 1; % Marcar las cajas que fueron seleccionadas
    end
end

% Mostrar las cajas seleccionadas 
disp('Cajas seleccionadas:');
cajasSeleccionadasIndices = find(cajasSeleccionadas == 1);  % Encuentra las posiciones de las cajas seleccionadas
disp(cajasSeleccionadasIndices);

% Mostrar el peso total
disp(['Peso total transportado: ', num2str(suma)]);
