function y = griewangk(x)
    n = length(x);
    sum_term = sum(x.^2 / 4000);
    prod_term = prod(cos(x ./ sqrt(1:n)));
    
    y = sum_term - prod_term + 1;
end