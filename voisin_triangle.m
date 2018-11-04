

% 24 mars 2018
% Input: index et matrice binaige
% Output: les voisins de la position d'entré
% Fonction qui détermine les voisins d'un élément POUR UNE GRILLE
% TRIANGULAIRE

function [v] = voisin_triangle(i,M)

n = size(M,1);
m = size(M,2);

if mod(i,n) == 0
    x = n;
else
    x = mod(i,n);
end
y = ceil(i/n);

v=zeros(3,3);

% droite et gauche sont toujours des voisins.
% Parfois, le troisième voisin est en haut et d'autres fois il est en bas
% L'ordre de la matrice voisin sera donc: droite, gauche, haut/bas
% Chaque colonne de v contient l'information suivante: la valeur du
% voisin, sa ligne et sa colonne.




% droite
if y+1<=m
    v(1,1) = M(x,y+1);
    v(2,1) = x;
    v(3,1) = y+1;
else
    v(1,1) = 0;
    v(2,1) = 0;
    v(3,1) = 0;
end

% Gauche
if y-1>=1
    v(1,2) = M(x,y-1);
    v(2,2) = x;
    v(3,2) = y-1;
else
    v(1,2) = 0;
    v(2,2) = 0;
    v(3,2) = 0;
end


% dépendamment de la ligne et de la colonne de l'élément étuidé, le voisin
% sera en haut ou en bas.


% Bas si la parité de x et y est la même
% Haut si la parité de x et de y sont différentes
parite_ligne=mod(x,2);
parite_colonne=mod(y,2);

if parite_ligne==parite_colonne
    % Bas
    if x+1<=n
        v(1,3) = M(x+1,y);
        v(2,3) = x+1;
        v(3,3) = y;
    else
        v(1,3) = 0;
        v(2,3) = 0;
        v(3,3) = 0;
    end
    
    
elseif parite_ligne~=parite_colonne
    % Haut
    if x-1>=1
        v(1,3) = M(x-1,y);
        v(2,3) = x-1;
        v(3,3) = y;
    else
        v(1,3) = 0;
        v(2,3) = 0;
        v(3,3) = 0;
    end
end



end