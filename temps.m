clear all;clc;

n = 10:1:200; % Grandeur de la matrice
p = 0.1:0.1:1; % Probabilité

for i = 1:length(p) % Parcours p
    i
    for j = 1:length(n) % Parcours n
        % Génération de la Grille
        tic;
        M = Grille_case(n(j),n(j),p(i));
        t_grillecase(i,j) = toc;
        
% A fonctionné!        
%         % CCL42.m
%         tic;
%         RC = ccl_42(M);
%         t_ccl42(i,j) = toc;
        
        % BWLABEL.m
        tic;
        RC = bwlabel(M);
        t_bwlabel(i,j) = toc;
        
%         % Récursion CARRÉ
%         tic;
%         RC = verif_percol_recursion_4(M);
%         t_recursion_carre(i,j) = toc;
%         
%         % Récursion TRIANGLE
%         tic;
%         RC = verif_percol_recursion_3(M);
%         t_recursion_triangle(i,j) = toc;
%         
%         % Récursion HEXAGONE
%         tic;
%         RC = verif_percol_recursion_6(M);
%         t_recursion_hexagone(i,j) = toc;
        
        % CARRÉ
        tic;
        RC = verif_percolation_4(M);
        t_cluster_carre(i,j) = toc;
        
% A fonctionné!         
%         % TRIANGLE
%         tic;
%         RC = verif_percolation_triangle(M);
%         t_cluster_triangle(i,j) = toc;
        
        % HEXAGONE
        tic;
        RC = verif_percolation_6(M);
        t_cluster_hexagone(i,j) = toc;
    end
end

figure(1)
surf(n,p,t_grillecase);
xlabel('Dimension');
ylabel('Probabilité');
zlabel('Temps');
title('Grille_case.m');

% figure(2);
% surf(n,p,t_ccl42);
% xlabel('Dimension');
% ylabel('Probabilité');
% zlabel('Temps');
% title('ccl_42.m');

figure(3);
surf(n,p,t_bwlabel);
xlabel('Dimension');
ylabel('Probabilité d''occupation');
zlabel('Temps de calcul (s)');
title('bwlabel.m');

figure(4);
surf(n,p,t_cluster_carre);
xlabel('Dimension');
ylabel('Probabilité');
zlabel('Temps de calcul (s)');
title('verif_percolation_4.m');

% figure(5);
% surf(n,p,t_cluster_triangle);
% xlabel('Dimension');
% ylabel('Probabilité d''occupation');
% zlabel('Temps');
% title('verif_percolation_triangle.m');
%
% figure(6);
% surf(n,p,t_cluster_hexagone);
% xlabel('Dimension');
% ylabel('Probabilité');
% zlabel('Temps');
% title('verif_percolation_6.m');