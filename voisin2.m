% Cette fonction détermine les 4 voisins d'une position. L'entrée est la
% position dans la matrice (i) ainsi que le 

% Droite, Gauche, Haut, Bas

function [v] = voisin2(i,M)

n = size(M,1);
m = size(M,2);

if mod(i,n) == 0
    x = n;
else
    x = mod(i,n);
end
y = ceil(i/n);

v=zeros(3,2);

% Gauche
if y-1>=1
    v(1,1) = M(x,y-1);
    v(2,1) = x;
    v(3,1) = y-1;
else
    v(1,1) = 0;
    v(2,1) = 0;
    v(3,1) = 0;
end

% Haut
if x-1>=1
    v(1,2) = M(x-1,y);
    v(2,2) = x-1;
    v(3,2) = y;
else
    v(1,2) = 0;
    v(2,2) = 0;
    v(3,2) = 0;
end

end