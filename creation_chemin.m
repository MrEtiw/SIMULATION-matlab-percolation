% Cette fonction affiche une matrice de valeur NaN avec le chemin le plus
% court. Ce chemin comment au point de départ avec la valeur 1 et augmente
% par incrément de 1 avec chaque case jusqu'à la case d'arrivée. La case
% d'arrivée afficehra le plus grand chiffre qui sera aussi la longueur du
% chemin le plus court.

% La fonction utilise le vecteur Q des fonctions
% path_sample_point_colonne.m ou path_sample_point_point.m (voir ces
% fonctions pour comprendre la matrice Q).

function [matrice] = creation_chemin(M,Q)
n=size(M,1);
m=size(M,2);
matrice=NaN*ones(n,m);
for i = 1:size(Q,2)
    x = Q(1,i);
    y = Q(2,i);
    valeur = Q(3,i);
    matrice(x,y) = valeur;
end

end