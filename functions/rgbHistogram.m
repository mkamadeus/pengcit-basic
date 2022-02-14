function hist = rgbHistogram(path, format) 
    % read image from path
    image = imread(path, format);
    image_size = size(image);
    
    % initialize empty frequency table
    hist = zeros(3,256);
    
    for chan = 1:3
        for i= 1:image_size(1)
            for j=1:image_size(2)
                hist(chan, image(i, j)+1) = hist(chan, image(i, j)+1) + 1 ;
            end
        end
    end
end