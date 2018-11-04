% **************************************************************
% * Projet II - PHS3902                                        *
% * Karl Egner (1794857)                                       *
% * Etienne Boisvenue (1798942)                                *
% **************************************************************
%Fonction qui imite  bwlabel. Elle prend en entrée une matrice binaire M et
%donne en sortie la matrice L dans laquelle tous les amas sont identifiés
%par un numéro.

% LAST MODIFIED ON: 2018-02-16

function [L] = ccl_42(M)

n = size(M,1);
m = size(M,2);
longueur = n*m;

Heritage = [];

label = 1;

% On fait une première itération. Un premier jet pour la définir la matrice
% L. On passe à travers la matrice binaire M, on regarde les voisins de
% chaque case (voir fonction voisin4). Si tous les voisins sont des 1 ou des
% 0, la case prend la valeur de label et tous les voisins non-nul prennent
% également la valeur de label. Si un voisin de la case n'est pas un 0 ou un 1,
% la case prend la valeur minimal de ses voisins

% Matrice Heritage (1er passage)
for i = 1:longueur
    carre = M(i);
    % Verification qu'on est sur un 1
    if carre ~= 0;
        voisins = voisin2(i,M);
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

% On obtient donc une premiere version de L. Ensuite, on repasse à travers
% cette matrice jusqu'à temps que pour chaque case, tous ses voisins sont
% soient des 0 ou possède la même valeur que lui-même.
% On entre dans le while tant et aussi longtemps que nous devons changer la
% valeur de au moins une case lors d'une itération



% Changement des valeurs dans la matrice L avec la matrice Heritage
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
            elseif size(commun,1)==1
                ajout = colonne_heritage(find(colonne_heritage~=commun));
                % Ajouter la valeur non-identique a la fin du cluster
                cluster{c}(end+1) = ajout;
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
L = M;
end