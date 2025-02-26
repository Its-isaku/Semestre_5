function sortedArray = mergeSort2D(array)
    if size(array, 1) <= 1
        sortedArray = array;
    else
        mid = floor(size(array, 1) / 2);
        leftHalf = mergeSort2D(array(1:mid, :));
        rightHalf = mergeSort2D(array(mid+1:end, :));
        sortedArray = merge2D(leftHalf, rightHalf);
    end
end

function sortedArray = merge2D(leftHalf, rightHalf)
    sortedArray = [];
    while ~isempty(leftHalf) && ~isempty(rightHalf)
        if leftHalf(1, 1) <= rightHalf(1, 1) % Compara la primera columna (x)
            sortedArray = [sortedArray; leftHalf(1, :)];
            leftHalf(1, :) = [];
        else
            sortedArray = [sortedArray; rightHalf(1, :)];
            rightHalf(1, :) = [];
        end
    end
    sortedArray = [sortedArray; leftHalf; rightHalf];
end