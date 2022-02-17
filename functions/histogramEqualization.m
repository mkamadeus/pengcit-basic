function output = histogramEqualization(I)
    %HISTOGRAMEQUALIZATION Summary of this function goes here
    %   Detailed explanation goes here
    
    imageSize = size(I);
    pixelCount = imageSize(1) * imageSize(2);
    
    hist = histogramz(I);
    histNormalized = hist / pixelCount;
    
    sum = 0.0;
    histEqualized = zeros(1, 256);
    for i = 1:256
        sum = sum + histNormalized(i);
        histEqualized(i) = min(floor(sum * 255), 255);
    end

    output = histEqualized(I + 1);
    output = cast(output, 'uint8');
end

