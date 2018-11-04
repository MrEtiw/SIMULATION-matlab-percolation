% **************************************************************
% * Projet II - PHS3902                                        *
% * Karl Egner (1794857)                                       *
% * Etienne Boisvenue (1798942)                                *
% **************************************************************
%Fonction qui imite  bwlabel mais dans un réseau triangulaire. Elle prend en entrée une matrice binaire M et
%donne en sortie la matrice L dans laquelle tous les amas sont identifiés
%par un numéro.

% LAST MODIFIED ON: 2018-03-24



function [L] = ccl_triangle(M)
n = size(M,1);
m = size(M,2);
longueur = n*m;

Heritage = [];

label = 1;

% On passe à travers la matrice une première fois. On regarde les voisins
% de haut et de gauche.

% Matrice Heritage (1er passage)
for i = 1:longueur
    carre = M(i);
    % Verification qu'on est sur un 1
    if carre ~= 0;
        voisins = voisin_triangle_HG(i,M);
        % Si tout voisins sont 0 ou 1
        if sum(voisins(1,:)<=1) == 2
            label = label+1;
            M(i) = label;
        %ce else représente que j'ai un voisin qui n'est pas un 1 ou un 0
        else
            v = voisins(1,:);
            nzv = nonzeros(v); % Enlever les valeurs 0
            val = min(nzv);
            M(i) = val;
            if min(nzv) ~= max(nzv)
                H = [min(nzv);max(nzv)];
                Heritage = [Heritage H];
            end
        end
    end
end

%Deuxieme passage. On veut que toutes les équivalences qui sont incluses
%dans Heritage fassent partie du même cluster final.

if isempty(Heritage)==0
    cluster = {};
    cluster{1} = Heritage(:,1);
    
    for h = 2:size(Heritage,2)
        compteur = 0;
        colonne_heritage = Heritage(:,h);
        longueur = size(cluster,2);
        for c = 1:longueur
            colonne_cluster = cluster{c};
            commun = intersect(colonne_heritage,colonne_cluster);
            if isempty(commun)
                compteur = compteur+1;
                % Ajoute la valeur (unique) de commun a cluster
            elseif size(commun,1)==1|| size(commun,1)==2
                ajout = colonne_heritage(find(colonne_heritage~=commun));
                % Ajouter la valeur non-identique a la fin du cluster
                cluster{c}=[cluster{c}; ajout];
            end
        end
        if compteur==longueur
            cluster{end+1} = colonne_heritage;
        end
    end
    
    % for a travers Cluster
    for i = 1:size(cluster,2)
        valeur = min(cluster{i});
        for j = 1:length(cluster{i})
            M(M==cluster{i}(j)) = valeur;
        end
    end
end

L=M;

end
