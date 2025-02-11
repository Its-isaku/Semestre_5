function p=Ej3(a,b,c); 
d=b^2-4*a*c; 
disp ('La ecuación a resolver es...')
disp(['(',num2str(a),')x^2+(',num2str(b),')x+(',num2str(c),')']) 

if a==0 
    disp('La ecuación no es de segundo grado') 
else
    if d==0 
        disp('La ecuación tiene una raíz doble:')
        p=-b/2*a; 
    elseif d>0 
        disp('La ecuación tiene dos raíces reales:')
        p(1)=(-b+sqrt(d))/2*a; 
        p(2)=(-b-sqrt(d))/2*a; 
    else
        disp('La ecuación tiene dos raíces complejas:')
        p(1)=(-b+sqrt(d))/2*a; 
        p(2)=(-b-sqrt(d))/2*a; 
    end
end
