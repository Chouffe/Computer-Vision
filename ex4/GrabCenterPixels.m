function cim = GrabCenterPixels(im_fname, p)
    im = imread(im_fname);
    [H, W, dummy] = size(im);
    cim = im(floor(H*(1-p)/2)+1:floor(H*(1+p)/2), floor(W*(1-p)/2)+1:floor(W*(1+p)/2), :);
end
