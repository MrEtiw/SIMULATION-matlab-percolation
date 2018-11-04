
function[percolation]=verif_percol_recursion_4(M)

premiere_colonne=M(:,1);
departs=find(premiere_colonne);
nb_departs=length(departs);
n=size(M,1);
percolation=0;
for i=1:nb_departs
    discovery_time=zeros(n,n);
    discovery_time(departs(i))=1;
    next_start_carre(departs(i), M, discovery_time);
    resultat_1=dlmread('resultat_verif_percol_4.txt');
    if resultat_1==1
        % Faire une action qui garde en mémoire le fait que la grille M a
        % percoler
        percolation=1;
        break   
   end
end

end