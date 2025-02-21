function sortedArray = mergeSort(array)
    if length(array) <= 1
        sortedArray = array;
    else
        mid = floor(length(array)/2);
        leftHalf = mergeSort(array(1:mid));
        rightHalf = mergeSort(array(mid+1:end));
        sortedArray = merge(leftHalf, rightHalf);
    end
end