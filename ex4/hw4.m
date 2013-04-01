%% Ex1

[mu sig] = TrainColourModel('lfw/George_W_Bush/', 20);

%% Ex2

bike = imread('../ex1/StartImages/bike_small.jpg');
xs = reshape(bike, size(bike,1)*size(bike,2), 3);
lvals = GaussLikelihood(xs, mu, sig);
lvals3D = reshape(lvals, size(bike,1), size(bike,2), 1);

fig = figure;
imagesc(lvals3D);
colormap(gray);
axis equal;