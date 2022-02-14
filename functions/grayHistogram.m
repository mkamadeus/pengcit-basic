function hist = grayHistogram(path, format) 
    % read image from path
    image = imread(path, format);
    image = rgb2gray(image);
    image_size = size(image);
    
    % initialize empty frequency table
    hist = [zeros(1,256)];

    for i= 1:image_size(1)
        for j=1:image_size(2)
            hist(image(i, j)+1) = hist(image(i, j)+1) + 1 ;
        end
    end
end