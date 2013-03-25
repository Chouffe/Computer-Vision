function D = ComputeDistanceMatrix(Fs)

N = size(Fs, 2);

D = zeros(N, N);

for i=1:N
    for j=i:N
        D(j, i) = sqrt(sum((Fs{i}-Fs{j}).^2));
        D(i, j) = D(j, i);
    end
end
