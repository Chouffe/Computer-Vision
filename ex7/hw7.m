%% Ex 1
close all;
[X w h] = LoadData('../ex4/lfw/George_W_Bush/', 'jpg', 530, 0.5, 0.33);

%% Ex 2
[mu W D] = ComputePCABasis(X);
mean_face = reshape(mu, h, w);
fig1 = figure;
subplot(4,5,1);
imagesc(mean_face);
colormap(gray);
axis equal;

for i=1:19
    subplot(4,5,i+1);
    eigenface = reshape(W(:,i), h, w);
    imagesc(eigenface);
    axis equal;
end

[X2 w2 h2] = LoadData('ADAFACES/', 'bmp', 4859, 1, 1);
[mu2 W2 D2] = ComputePCABasis(X2);

fig2 = figure;
subplot(1,2,1);
plot(cumsum(D));
title('Bush dataset');
subplot(1,2,2);
plot(cumsum(D2));
title('Small face dataset');