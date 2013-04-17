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

[X2 w2 h2] = LoadData('ADAFACES/', 'bmp', 5000, 1, 1);
[mu2 W2 D2] = ComputePCABasis(X2);
mean_face2 = reshape(mu2, h2, w2);

fig2 = figure;
subplot(4,5,1);
imagesc(mean_face2);
colormap(gray);
axis equal;

for i=1:19
    subplot(4,5,i+1);
    eigenface = reshape(W2(:,i), h2, w2);
    imagesc(eigenface);
    axis equal;
end

fig3 = figure;
subplot(1,2,1);
plot(cumsum(D));
title('Bush dataset');
subplot(1,2,2);
plot(cumsum(D2));
title('Small face dataset');

%% Ex 3

student = imread('../ex4/StudentImages/Student4.jpg');
student = rgb2gray(student);
student = student(183:248, 297:362);

NB = [1 2 10 20 50 100 150 200 250];
fig4 = figure;
subplot(2,5,1);
imagesc(student);
title('Original image');
colormap(gray);
axis equal;

for i=1:9
    im = ReconstructFace(student, mu2, W2, w2, h2, NB(1,i));
    subplot(2,5,i+1);
    imagesc(im);
    title(sprintf('%d eigenfaces', NB(1,i)));
    axis equal;
end
    

