recta=input ('Introduce los coeficientes de la recta ax+by+c como [a,b,c]   ' ); 

x=input('coordenada x del punto a verificar  '); 
y=input('coordenada y del punto a verificar  '); 

p=recta(1)*x+recta(2)*y+recta(3); 

if p==0 
    disp('El punto pertenece a la recta'); 
elseif p<0 
    disp('El punto está por debajo de la recta '); 
else
    disp('El punto está por encima de la recta '); 
end
