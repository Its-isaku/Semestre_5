function sortedArray = merge(leftHalf, rightHalf)
    sortedArray = [];
    while ~isempty(leftHalf) && ~isempty(rightHalf)
        if leftHalf(1) <= rightHalf(1)
            sortedArray(end+1) = leftHalf(1); %#ok<AGROW>
            leftHalf(1) = [];
        else
            sortedArray(end+1) = rightHalf(1); %#ok<AGROW>
            rightHalf(1) = [];
        end
    end
    sortedArray = [sortedArray, leftHalf, rightHalf];
end