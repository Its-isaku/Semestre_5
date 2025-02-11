function p = Ej1_2(x)
    if length(x) == 1
        p = Ej1_1(x);
    elseif length(x) == 2
        fplot(@Ej1_1, [min(x), max(x)]);
        xlabel('x');
        ylabel('f(x)');
        title('Gráfica de Ej1(x)');
        grid on;
    else
        error('La función no está preparada para más de dos valores');
    end
end
