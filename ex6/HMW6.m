[X, labs, w, h] = LoadData('DData/');
[X1, labs1, w, h] = LoadData2('DData/', 1, 1000);

for d1=0:9
    w = PerceptronLearning(X, labs, d1);
    [tp, tn] = TestHyperplane(X1, labs1, d1, w);
    d1
    tp
    tn
end
