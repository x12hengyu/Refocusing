function [rgb_stack, gray_stack] = loadFocalStack(focal_stack_dir)
    file_stack = dir(fullfile(focal_stack_dir, '*.jpg'));
    stack_names = {file_stack.name};
    
    N = size(stack_names, 2);
    img_sample = imread(fullfile(focal_stack_dir, stack_names{1}));
    H = size(img_sample, 1);
    W = size(img_sample, 2);
    
    rgb_stack = zeros(H, W, 3*N);
    gray_stack = zeros(H, W, N);

    for i = 1:N
        cur_name = fullfile(focal_stack_dir, stack_names{i});
        cur_img = imread(cur_name);
        rgb_stack(:, :, 3*(i-1)+1 : 3*i) = cur_img;
        gray_stack(:, :, i) = rgb2gray(cur_img);
    end
end
