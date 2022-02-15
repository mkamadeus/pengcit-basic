function output = contrastStretching(input, a, b)
    image_size = size(input);
    disp(image_size);

    % get min and max contrast for the channel input based on specified
    % threshold
    min_value = min(min(input));
    max_value = max(max(input));
    
    disp(min_value);
    disp(max_value);

    rmin = (max_value-min_value)*a + min_value;
    rmax = (max_value-min_value)*b + min_value;

    disp(rmin);
    disp(rmax);
       
    % instantiate output
    output = zeros(image_size);
    
    % c o n t r a s t s t r e c h i n g
    for i= 1:image_size(1)
        for j=1:image_size(2)
            if (input(i, j) <= rmin)
                output(i, j) = 0;
            elseif (input(i, j) >= rmax)
                output(i, j) = 255;
            else
                output(i, j) = floor(double(255) * double(input(i, j) - rmin) / double(rmax - rmin));
                % disp(output(i,j))
            end
        end
    end
end 