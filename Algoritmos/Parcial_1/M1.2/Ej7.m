f=input('Introduce la función continua a estudio entre comillas y en la variable x  '); 

x=input(' Introduce el extremo inferior del intervalo a estudio   '); 
fa=eval(f,x); 

x=input(' Introduce el extremo superior del intervalo a estudio   '); 
fb=eval(f,x); 

if fa*fb<0 
    disp('Existe raíz de la función en el intervalo') 
elseif fa*fb>0 
    disp('No se puede asegurar que exista raíz de la función continua en el intervalo'); 
else
    disp('Algún extremo del intervalo es raíz de la función') 
end
