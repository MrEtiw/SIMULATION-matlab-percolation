
%%% 21 mars 2018
%%% Script qui vérifie si un grille M percole ou non, dans un treillis
%%% hexagonal. 

function [resultat]= verif_percolation_6(M)
    n=size(M,1);
    m=size(M,2);
    L = ccl_63(M);
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