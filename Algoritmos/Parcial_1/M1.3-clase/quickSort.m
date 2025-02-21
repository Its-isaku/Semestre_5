function sortedArray = quickSort(array)
    if length(array) <= 1
        sortedArray = array;
    else
        pivot = array(1);
        left = array(array < pivot);
        right = array(array > pivot);
        sortedArray = [quickSort(left), pivot, quickSort(right)];
    end
end