function p=Ej4(n); 
p=n.^2-4*n+3; 

n=input('Introduce el numero de términos a calcular, n= ') 
for i=1:n 
    a(i)=i^2-4*i+3; 
    plot(i,a(i),'*') 
    hold on 
end
a