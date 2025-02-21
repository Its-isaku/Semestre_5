function sortedArray = shellSort(array)
    n = length(array);
    gap = floor(n/2);
    
    while gap > 0
        for i = gap+1:n
            temp = array(i);
            j = i;
            
            while j > gap && array(j-gap) > temp
                array(j) = array(j-gap);
                j = j - gap;
            end
            
            array(j) = temp;
        end
        
        gap = floor(gap/2);
    end
    
    sortedArray = array;
end