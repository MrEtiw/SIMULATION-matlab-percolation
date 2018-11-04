% 24 mars 2018
% Input: index et matrice binaige
% Output: les voisins de la position d'entré
% Fonction qui détermine uniquemment  les voisins en haut et à gauche d'un élément POUR UNE GRILLE
% TRIANGULAIRE

function [v] = voisin_triangle_HG(i,M)

n = size(M,1);
m = size(M,2);

if mod(i,n) == 0
    x = n;
else
    x = mod(i,n);
end
y = ceil(i/n);

v=zeros(3,2);

% v contient les voisins. La premiere colonne est le voisin de gauche et la
% seconde colonne est le voisin de haut

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

parite_ligne=mod(x,2);
parite_colonne=mod(y,2);

% Haut
if parite_ligne~=parite_colonne && x-1>=1
    v(1,2) = M(x-1,y);
    v(2,2) = x-1;
    v(3,2) = y;
else
    v(1,2) = 0;
    v(2,2) = 0;
    v(3,2) = 0;
end
end