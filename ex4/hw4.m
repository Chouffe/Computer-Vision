%% Ex1
close all;

[mu_rgb sig_rgb] = TrainColourModel('lfw/George_W_Bush/', 0.2, 20, 0);

%% Ex2

bike = imread('../ex1/StartImages/bike_small.jpg');
xs = reshape(bike, size(bike,1)*size(bike,2), size(bike,3));
lvals = GaussLikelihood(xs, mu_rgb, sig_rgb);
prob_rgb = reshape(lvals, size(bike,1), size(bike,2), 1);

fig1 = figure;
subplot(2,4,1);
imagesc(prob_rgb);
colormap(gray);

%% Ex3

[mu_hsv sig_hsv] = TrainColourModel('lfw/George_W_Bush/', 0.2, 20, 1);
bike_hsv = rgb2hsv(xs);
bike_hsv = [cos(bike_hsv(:,1)), sin(bike_hsv(:,1)), bike_hsv(:,2:3)];
lvals = GaussLikelihood(bike_hsv, mu_hsv, sig_hsv);
prob_hsv = reshape(lvals, size(bike,1), size(bike,2), 1);

subplot(2,4,5);
imagesc(prob_hsv);

%% Ex4

% RGB
[mu_back_rgb sig_back_rgb] = TrainColourModel('BackgroundImages/', 1, 22, 0);
lvals = GaussLikelihood(xs, mu_back_rgb, sig_back_rgb);
prob_back_rgb = reshape(lvals, size(bike,1), size(bike,2), 1);

subplot(2,4,2);
imagesc(prob_back_rgb);

% HSV
[mu_back_hsv sig_back_hsv] = TrainColourModel('BackgroundImages/', 1, 22, 1);
lvals = GaussLikelihood(bike_hsv, mu_back_hsv, sig_back_hsv);
prob_back_hsv = reshape(lvals, size(bike,1), size(bike,2), 1);

subplot(2,4,6);
imagesc(prob_back_hsv);

subplot(2,4,3);
ratio_rgb = prob_rgb./prob_back_rgb;
imagesc(ratio_rgb);

subplot(2,4,7);
ratio_hsv = prob_hsv./prob_back_hsv;
imagesc(ratio_hsv);

subplot(2,4,4);
class_rgb = zeros(size(ratio_rgb));
class_rgb(find(ratio_rgb > 1)) = 1;
imagesc(class_rgb);

subplot(2,4,8);
class_hsv = zeros(size(ratio_hsv));
class_hsv(find(ratio_hsv > 1)) = 1;
imagesc(class_hsv);

%% Skin Classifier

fig2 = figure;
bim = SkinClassifier(bike, 0);
imagesc(bim);
colormap(gray);
axis equal;
