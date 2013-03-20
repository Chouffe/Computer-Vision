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
b1d = 0.957237*b + 0.0213814;

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

rp = ones(size(r1p));
gp = ones(size(g1p));
bp = ones(size(b1p));

tmp = [0; 0; 0];
product = inv(M) * P * M;
for i = 1:size(rp)(1)
    for j = 1:size(rp)(2)
        tmp = product * [r1p(i,j); g1p(i,j); b1p(i,j)];
        rp(i,j) = tmp(1);
        gp(i,j) = tmp(2);
        bp(i,j) = tmp(3);
    end
end

rd = ones(size(r1d));
gd = ones(size(g1d));
bd = ones(size(b1d));

tmp = [0; 0; 0];
product = inv(M) * D * M;
for i = 1:size(rd)(1)
    for j = 1:size(rd)(2)
        tmp = product * [r1d(i,j); g1d(i,j); b1d(i,j)];
        rd(i,j) = tmp(1);
        gd(i,j) = tmp(2);
        bd(i,j) = tmp(3);
    end
end

Rp = 255*(rp.^(1./2.2));
Gp = 255*(gp.^(1./2.2));
Bp = 255*(bp.^(1./2.2));

Rd = 255*(rd.^(1./2.2));
Gd = 255*(gd.^(1./2.2));
Bd = 255*(bd.^(1./2.2));

pim = image;
dim = image;

pim(:,:,1) = Rp;
pim(:,:,2) = Gp;
pim(:,:,3) = Bp;

dim(:,:,1) = Rd;
dim(:,:,2) = Gd;
dim(:,:,3) = Bd;
