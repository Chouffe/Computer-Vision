%% Ex1

[mu sig] = TrainColourModel('lfw/George_W_Bush/', 20, 0);

%% Ex2

bike = imread('../ex1/StartImages/bike_small.jpg');
xs = reshape(bike, size(bike,1)*size(bike,2), size(bike,3));
lvals = GaussLikelihood(xs, mu, sig);
lvals3D = reshape(lvals, size(bike,1), size(bike,2), 1);

fig = figure;
imagesc(lvals3D);
colormap(gray);
axis equal;

%% Ex3

[mu sig] = TrainColourModel('lfw/George_W_Bush/', 20, 1);
bike_hsv = rgb2hsv(xs);
bike_hsv = [cos(bike_hsv(:,1)), sin(bike_hsv(:,1)), bike_hsv(:,2:3)];
lvals = GaussLikelihood(bike_hsv, mu, sig);
size(lvals)
lvals3D = reshape(lvals, size(bike,1), size(bike,2), 1);

fig2 = figure;
imagesc(lvals3D);
colormap(gray);
axis equal;

