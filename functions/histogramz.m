function values = histogramz(image) 
    % initialize empty frequency table
    values = zeros(1, 256);

    image_size = size(image);

    for i= 1:image_size(1)
        for j=1:image_size(2)
            values(image(i, j) + 1) = values(image(i, j) + 1) + 1 ;
        end
    end
end