% **************************************************************
% * Projet II - PHS3902                                        *
% * Karl Egner (1794857)                                       *
% * Etienne Boisvenue (1798942)                                *
% * Derniere date de modification: 16 fevrier 2018             *
% **************************************************************
%EXTREMEMENT LONG ET PAS BON. CCL42 EST BIEN MEILLEURE (CONCEPT D'HÉRITAGE
%ET ON NE REGARDE QUE LES VOISINS DE HAUT ET DE GAUCHE)
%Fonction qui imite  bwlabel. Elle prend en entrée une matrice binaire M et
%donne en sortie la matrice L dans laquelle tous les amas sont identifiés
%par un numéro.


function [L]=ccl_4(M)

n = size(M,1);
m = size(M,2);
longueur = n*m;

label = 1;


%On fait une première itération. Un premier jet pour la définir la matrice
%L. On passe à travers la matrice binaire M, on regarde les voisins de
%chaque case (voir fonction voisin4). Si tous les voisins sont des 1 ou des
%0, la case prend la valeur de label et tous les voisins non-nul prennent
%également la valeur de label. Si un voisin de la case n'est pas un 0 ou un 1,
%la case prend la valeur minimal de ses voisins
tic;
for i = 1:longueur
    carre = M(i);
    if carre ~= 0;
        voisins = voisin4(i,M);
        if sum(voisins(1,:)<=1) == 4
            label = label+1;
            M(i) = label;
            for j=1:4
                if voisins(1,j)==1
                    posix_voisin=voisins(2,j);
                    posiy_voisin=voisins(3,j);
                    M(posix_voisin,posiy_voisin)=label;
                end
                
            end
            
            %ce else représente que j'ai un voisin qui n'est pas un 1 ou un 0
        else
            v = voisins(1,:);
            nzv = nonzeros(v); % Enlever les valeurs 0
            nzv(nzv==1) = []; % Enlever les valeurs 1
            val =min(nzv);
            M(i) = val;
            
            
        end
    end
end

premier_temps=toc
%on obtient donc une premiere version de L. Ensuite, on repasse à travers
%cette matrice jusqu'à temps que pour chaque case, tous ses voisins sont
%soient des 0 ou possède la même valeur que lui-même.
%On entre dans le while tant et aussi longtemps que nous devons changer la
%valeur de au moins une case lors d'une itération


var=1;
while var==1
    var=0;
    changement_de_valeur=0;
    
    for j=1:longueur
        if M(j)~= 0
            
            voisins=voisin4(j,M);
            valeurs_voisins=voisins(1,:);
            nz_voisins=nonzeros(valeurs_voisins);
            voisin_minimal=min(nz_voisins);
            
            nombre_zeros=sum(valeurs_voisins==0);
            nombre_identique=sum(nz_voisins==M(j));
            
            
            somme=nombre_zeros+nombre_identique;
            
            
            if somme~=4
                M(j)=voisin_minimal;
                changement_de_valeur=changement_de_valeur+1;
                
                for t=1:4
                    if valeurs_voisins(t)>M(j)
                        x=voisins(2,t);
                        y=voisins(3,t);
                        M(x,y)=M(j);
                    end
                end
                
                
                
            end
            
        end
        
        
    end
    
    if changement_de_valeur>0
        var=1;
    end
    
end

L=M;
deuxieme_temps=toc
temps_boucle_while=deuxieme_temps-premier_temps
end
