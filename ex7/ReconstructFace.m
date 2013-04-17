function rim = ReconstructFace(im, mu, W, w, h, N)
    cim = imresize(im, [h, w]);
    cim = double(reshape(cim, [1 h*w]));
    m = mean(cim);
    s = std(cim);
    cim = (cim - m)/s;
    
    coeff = zeros(N, 1);
    rim = mu;
    for i=1:N
        coeff(i,1) = (cim-mu')*W(:,i);
        rim = rim + coeff(i,1)*W(:,i);
    end
    rim = s*rim + m;
    rim = reshape(rim, h, w);
    rim = imresize(rim, size(im));
end