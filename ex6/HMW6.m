[X, labs, w, h] = LoadData('DData/');
[X1, labs1, w, h] = LoadData2('DData/');

nmax = 9;
results = zeros(5,nmax);
for d1=0:9
    w = PerceptronLearning(X, labs, d1);
    [tp, tn, fp, fn] = TestHyperplane(X1, labs1, d1, w);
    results(1, d1+1) = d1;
    results(2, d1+1) = tp;
    results(3, d1+1) = tn;
    results(4, d1+1) = fp;
    results(5, d1+1) = fn;
end

results
