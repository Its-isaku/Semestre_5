function sortedArray = radixSort(array)
    maxNum = max(array);
    exp = 1;
    
    while floor(maxNum/exp) > 0
        array = countingSortByDigit(array, exp);
        exp = exp * 10;
    end
    
    sortedArray = array;
end