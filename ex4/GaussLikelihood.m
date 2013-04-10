function lvals = GaussLikelihood(xs, mu, Sigma)
    xs2 = double(xs);
    lvals =  zeros(size(xs,1),1);
    iSigma = inv(Sigma);
    detSigma = det(Sigma);
    for i = 1:size(xs,1)
        lvals(i) = exp(-0.5*(xs2(i,:)-mu)/Sigma*transpose(xs2(i,:)-mu))/((2*pi)^(size(xs2,2)/2)*sqrt(abs(detSigma)));
    end
end
