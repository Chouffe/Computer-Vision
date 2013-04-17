function fs = ExtractGridHistogram(im, ng, nbins)

xs = floor(linspace(1, size(im, 2)+1, ng+1));
ys = floor(linspace(1, size(im, 1)+1, ng+1));
ii = xs(1):xs(2)-1;
jj = ys(1):ys(2)-1;

fs = [];
for i=1:ng
    ii = xs(i):xs(i+1)-1;
    for j=1:ng
        jj = ys(j):ys(j+1)-1;
        pim = im(jj, ii);
        tfs = hist(pim(:), nbins);
        tfs = tfs(:)/sum(tfs);
        fs = [fs; tfs];
    end
end
