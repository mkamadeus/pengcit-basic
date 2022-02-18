function newimage = histogramSpecification(image, spec)
    
    % init values
    hist = histogramz(image);
    image_size = size(image);
    histeq = zeros(256);
    speceq = zeros(256);
    invhist = zeros(256);
    
    % eq for original image
    for i=1:256
        sum = 0.0;
        for j=1:i
            sum = sum + hist(j);
        end
        histeq(i) = floor(255*sum);
    end
    
    % eq for spec histogram
    for i=1:256
        sum = 0.0;
        for j=1:i
            sum = sum + spec(j);
        end
        speceq(i) = floor(255*sum);
    end
       
    % inversetransform histogram
    for i=1:256
        minj = 1;
        minval = abs(histeq(i) - speceq(minj));
        for j=1:256
            curval = abs(histeq(i) - speceq(j));
            if (curval < minval)
                minval = curval;
                minj = j;
            end
        end

        invhist(i) = minj;
    end
    
    % remap image to new histogram
    newimage = zeros(image_size, 'uint8');
    for i=1:image_size(1)
        for j=1:image_size(2)
            newimage(i,j)=invhist(image(i,j)+1);
        end
    end

end