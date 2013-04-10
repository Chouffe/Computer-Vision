function bim = SkinClassifier(im, hsv)
    % Skin Classifier returns the binary im of classified pixels
    % hsv = 0 => rgb
    % hsv = 1 => hsv
    
    [mu sig] = TrainColourModel('lfw/George_W_Bush/', 0.2, 20, hsv);
    xs = reshape(im, size(im,1)*size(im,2), size(im,3));
    if hsv > 0
        xs = rgb2hsv(xs);
        xs = [cos(xs(:,1)), sin(xs(:,1)), xs(:,2:3)];
    end

    lvals = GaussLikelihood(xs, mu, sig);
    prob = reshape(lvals, size(im,1), size(im,2), 1);

    [mu_back sig_back] = TrainColourModel('BackgroundImages/', 1, 22, hsv);
    lvals = GaussLikelihood(xs, mu_back, sig_back);
    prob_back = reshape(lvals, size(im,1), size(im,2), 1);

    ratio = prob./prob_back;
    bim = zeros(size(ratio));
    bim(find(ratio > 1)) = 1;

end
