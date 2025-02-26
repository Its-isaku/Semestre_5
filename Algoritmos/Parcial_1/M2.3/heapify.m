function array = heapify(array, n, i)
    largest = i;
    left = 2 * i;
    right = 2 * i + 1;
    
    if left <= n && array(left) > array(largest)
        largest = left;
    end
    
    if right <= n && array(right) > array(largest)
        largest = right;
    end
    
    if largest ~= i
        array([i largest]) = array([largest i]);
        array = heapify(array, n, largest);
    end
end