function y = f(x)
    if x < 1
        y = -1;
    elseif x >= 1 && x <= 7
        y = 1/x;
    else
        y = 0.125;
    end
end
