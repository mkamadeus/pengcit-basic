function output = histogramEqualization(I)
    % iniate values
    imageSize = size(I);
    pixelCount = imageSize(1) * imageSize(2);
    
    % normalize histogram
    hist = histogramz(I);
    histNormalized = hist / pixelCount;
    
    % get minimal value
    sum = 0.0;
    histEqualized = zeros(1, 256);
    for i = 1:256
        sum = sum + histNormalized(i);
        histEqualized(i) = min(floor(sum * 255), 255);
    end
    
    % return normalized image
    output = histEqualized(I + 1);
    output = cast(output, 'uint8');
end

