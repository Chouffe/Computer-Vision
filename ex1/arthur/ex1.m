function [pim, dim] = ex1(image)

R = double(image(:,:,1));
G = double(image(:,:,2));
B = double(image(:,:,3));

r = (R/255).^2.2;
g = (G/255).^2.2;
b = (B/255).^2.2;

% Protanopes
r1p = 0.992052*r + 0.003974;
g1p = 0.992052*g + 0.003974;
b1p = 0.992052*b + 0.003974;

% deuteranopes
r1d = 0.957237*r + 0.0213814;
g1d = 0.957237*g + 0.0213814;
g1d = 0.957237*b + 0.0213814;

% Matrix transformations
M = [17.8824   , 43.5161  , 4.11935;
     3.45565   , 27.1554  , 3.86714;
     0.0299566 , 0.184309 , 1.46709];

P = [0 , 2.02344 , -2.52581;
     0 , 1       , 0;
     0 , 0       , 1];

D = [1        , 0 , 0;
     0.494207 , 0 , 1.24827;
     0        , 0 , 1];

% V(:,:,1) = r1p;
% V(:,:,2) = g1p;
% V(:,:,3) = b1p;
Vp = [r1p; g1p; b1p];
Vd = [r1p; g1p; b1p];
% size(R)
% size(G)
% size(B)
% size(M)
% size(P)
% size(V)
p = inv(M) * P * M * Vp; % Fuckin' Problem of dimensions here
d = inv(M) * D * M * Vd; % And here toooo!!

Rp = 255*(p(1).^(1./2.2));
Gp = 255*(p(2).^(1./2.2));
Bp = 255*(p(3).^(1./2.2));

Rd = 255*(d(1).^(1./2.2));
Gd = 255*(d(2).^(1./2.2));
Bd = 255*(d(3).^(1./2.2));

pim = image;
dim = image;

pim(:,:,1) = Rp;
pim(:,:,2) = Gp;
pim(:,:,3) = Bp;

im(:,:,1) = Rd;
im(:,:,2) = Gd;
im(:,:,3) = Bd;
