function [cim w h] = GrabCenterPixelsForFaces(im_fname, ph, pw)
    im = imread(im_fname);
    if ndims(im) == 3
        im = rgb2gray(im);
    end
    [H, W, dummy] = size(im);
    cim = im(floor(H*(1-ph)/2)+1:floor(H*(1+ph)/2), floor(W*(1-pw)/2)+1:floor(W*(1+pw)/2), :);
    h = size(cim,1);
    w = size(cim,2);
    cim = double(reshape(cim, [1, h*w]));
    
    mu = mean(cim);
    sigma = std(cim);
    cim = (cim - mu)/sigma;
end
