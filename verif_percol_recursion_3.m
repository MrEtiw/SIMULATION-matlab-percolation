

%% Vérification de s'il y a percolation ou non à partir de la méthode de la récursion pour une treillis triangulaire

function[percolation]=verif_percol_recursion_3(M)
dimension=size(M);
n=dimension(1);
premiere_colonne=M(:,1);
departs=find(premiere_colonne);
nb_departs=length(departs);
percolation=0;
for i=1:nb_departs
    discovery_time=zeros(n,n);
    discovery_time(departs(i))=1;
    next_start_triangle(departs(i), M, discovery_time);
    resultat=dlmread('resultat_verif_percol_3.txt');
    if resultat==1
        percolation=1;
        break   
   end
end



end
