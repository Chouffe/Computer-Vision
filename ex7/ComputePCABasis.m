function [mu, W, D] = ComputePCABasis(X)
    mu = mean(X, 2);
    W = 0;
    D = 0;
    [d n] = size(X);
    
    Xc = X;
    for i=1:n
        Xc(:,i) = X(:,i) - mu;
    end
    
    if d > n
        C1 = Xc'*Xc/n;
        [W,D] = eig(C1);
        W = Xc * W;
    else
        C = Xc*Xc'/n;
        [W,D] = eig(C);
    end
    
    D = flipdim(diag(D)',2);
    W = flipdim(W,2);
    
    for i=1:size(W,2)
        W(:,i) = W(:,i)/norm(W(:,i));
    end
    
end