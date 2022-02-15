function output = contrastStretching(input, a, b)
    image_size = size(input);
    for chan = image_size(3);
        % get input for current channel
        chan_input = input(:, :, chan);

        % get min and max contrast for the channel input based on specified
        % threshold
        rmin = min(chan_input(chan_input > a));
        rmax = max(chan_input(chan_input < b));
           
        % instantiate output
        output = zeros(image_size);
        
        % c o n t r a s t s t r e c h i n g
        for i= 1:image_size(1)
            for j=1:image_size(2)
                if (chan_image(i, j) <= rmin)
                    output(i, j, chan) = 0;
                elseif (chan_image(i, j) >= rmax)
                    output(i, j, chan) = 255;
                else
                    output(i, j, chan) = floor(255 * (chan_image(i, j) - rmin) / (rmax - rmin));
                end
            end
        end
    end 
end