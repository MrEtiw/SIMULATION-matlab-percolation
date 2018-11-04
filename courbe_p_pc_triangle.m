clear all;clc;

% Dimensions de la grille
n = 120;
m = 120;

% Nombre d'itérations
iteration = 100;

% Vecteur des probabilités d'occupation
prob = [0.66:0.001:0.73];

% Initialisation de la matrice qui stock les résutlats des itérations de
% Monte Carlo
resultats = zeros(iteration,length(prob));

for j = 1:iteration
    for i = 1:length(prob)
        [j i]
        M = Grille_case(n,m,prob(i));
        resultats(j,i) = verif_percol_recursion_3(M);
    end
end

% Moyenne des itérations de Monte Carlo
me = mean(resultats);

% Tracage de la courbe
figure()
plot(prob,me)
xlabel('Probabilite d''occupation');
ylabel('Probabilite de percolation');
title('Treillis triangulaire');

donnees_triangle = [prob;mean(resultats)];