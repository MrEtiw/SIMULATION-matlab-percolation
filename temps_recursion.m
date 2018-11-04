clear all;clc;

n = 10:1:100; % Grandeur de la matrice
p = 0.1:0.025:1; % Probabilité
monte_carlo = 10;

for h = 1:monte_carlo
    for i = 1:length(p) % Parcours p
        for j = 1:length(n) % Parcours n
            [h i j]
            
            M = Grille_case(n(j),n(j),p(i));
            
            % Récursion CARRÉ
            tic;
            RC = verif_percol_recursion_4(M);
            t_recursion_carre(i,j) = toc;

            % Récursion TRIANGLE
            tic;
            RC = verif_percol_recursion_3(M);
            t_recursion_triangle(i,j) = toc;
            
            % Récursion HEXAGONE
            tic;
            RC = verif_percol_recursion_6(M);
            t_recursion_hexagone(i,j) = toc;
        end
    end
    tot_hexagone{h} = t_recursion_hexagone;
    tot_triangle{h} = t_recursion_triangle;
    tot_carre{h} = t_recursion_carre;
end

% Moyenne des essais de Monte-Carlo

carre = tot_carre{1};
triangle = tot_triangle{1};
hexagone = tot_hexagone{1};

for l = 2:monte_carlo
    carre = carre + tot_carre{l};
    triangle = triangle + tot_triangle{l};
    hexagone = hexagone + tot_hexagone{l};
end

figure(1)
surf(n,p,carre./monte_carlo)
xlabel('Dimension');ylabel('Probabilité d''occupation');zlabel('Temps de calcul (s)');

figure(2)
surf(n,p,hexagone./monte_carlo)
xlabel('Dimension');ylabel('Probabilité d''occupation');zlabel('Temps de calcul (s)');

figure(3)
surf(n,p,triangle./monte_carlo)
xlabel('Dimension');ylabel('Probabilité d''occupation');zlabel('Temps de calcul (s)');
