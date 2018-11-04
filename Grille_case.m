function [M] = Grille_case(n,m,p)

    % Cette fonction génère une grille de dimension nxm avec une probabilité
    % d'occupation de p. Chacune des cases a la probabilité p d'être occupé.
    rng shuffle;
    R = rand(n,m);
    M = R<=p;
    M=M*eye(n,m);

   %colormap([1 1 1;0 0 0]);
    %colorbar
    %image(M.*255);
end