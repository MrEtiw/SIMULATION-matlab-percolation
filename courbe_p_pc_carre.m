clear all;clc;
tic
% Dimensions de la grille
n = 50;
m = 50;

% Nombre d'itérations
iteration = 50;

% Vecteur des probabilités d'occupation
prob = [0.1:0.01:0.9];

% Initialisation de la matrice qui stock les résutlats des itérations de
% Monte Carlo
resultats = zeros(iteration,length(prob));

for j = 1:iteration
    j
    for i = 1:length(prob)
        
        M = Grille_case(n,m,prob(i));
        resultats(j,i) = verif_percolation_4(M);
    end
end

% Moyenne des itérations de Monte Carlo
me = mean(resultats);

toc

% Tracage de la courbe
figure()
plot(prob,me)
xlabel('Probabilite d''occupation');
ylabel('Probabilite de percolation');
title('Treillis carré');

donnees_carre = [prob;mean(resultats)];


graph2=plot(prob,etat)
set(graph2,'LineWidth',4);
set(findall(gcf,'-property','FontSize'),'FontSize',20)


