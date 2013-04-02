function [X, Y] = FindBiggestComp(cs)

[L, nl] = bwlabeln(cs);

sz = zeros(1, nl);
for i=1:nl
  sz(i) = sum(L(:) == i);
end
[ssz, ind] = max(sz);

[I, J] = find(L == ind);
X = [min(J), min(J), max(J), max(J)];
Y = [min(I), max(I), max(I), min(I)];
