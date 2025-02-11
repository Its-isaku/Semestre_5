n=input('Introduce el numero de filas '); 
m=input('Introduce el numero de columnas '); 
a=[];

for i=1:n 
    for j=1:m 
        a(i,j)=i^2+j; 
    end 
end
a