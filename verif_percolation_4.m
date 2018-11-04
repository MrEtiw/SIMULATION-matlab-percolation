%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Etienne Boisvenue(1798942) %% 
%% Karl Egner(1794857)        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Fonction qui determine si un amas se rend d'un bout a l'autre de la matrice
%% Nom: verif_percolation_4
%% Version du 26 janvier 2018

function [resultat]= verif_percolation_4(M)
    L = bwlabel(M,4);
    premier=L(:,1);
    dernier=L(:,end);
    comparaison=intersect(premier,dernier);
    comparaison=nonzeros(comparaison);
    if isempty(comparaison)==1
        %fprintf('Pas de percolation')
        resultat=0;
    else
        %fprintf('Percolation\n')
        %nb_chemins=length(comparaison);
        %fprintf('Il y a %d chemins de percolation ', nb_chemins);
        resultat=1;
    end
end


