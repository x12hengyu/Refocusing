function refocusApp(rgb_stack, depth_map)
    [H, W, NNN] = size(rgb_stack);
    N = NNN / 3;
    i = randi(N); % start from random image
    
    fig = figure("name", "refocusApp");

    while true
        cur_img = rgb_stack(:, :, (i - 1) * 3 + 1 : (i * 3));
        
        imshow(uint8(cur_img)) % show img
        [y, x] = ginput(1); % choose point
        x = round(x);
        y = round(y);
        % out of bound
        if y < 1 || y > W || x < 1 || x > H
            break
        end

        i = depth_map(x, y); % refocus
    end
    
    close(fig);
end
