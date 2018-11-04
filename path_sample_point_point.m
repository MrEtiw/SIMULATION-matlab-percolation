% Fonction qui prend une matrice en entrée et vérifie les chemins de
% percolations possible. La sortie est le vecteur qui représente le chemin
% de percolation.

% Ce chemin de percolation est affiché dans la matrice Q. Cette matrice est
% une matrice de trois lignes avec autant de colonnes que de points dans le
% chemin le plus court. La premièr ligne représente les positions en x, la
% deuxième représente les position en y des points alors que la troisième
% représente le compteur (q) de l'ittération du calcul de chemin. En
% d'autres mots, le nombre (q) est le numéro du point à partir du départ (l
% longueur du chemin jusqu'à ce point)

% Depart doit etre un vecteur colonne avec x et y en entree. Il en est de
% meme pour arrivee. M est la matrice etudiee

function [Q] = path_sample_point_point(M,depart,arrive)

condition = true; % Condition de la boucle while
Q = []; % Matrice queue finale
q = 0;
Q_temp = zeros(3,4);

n = size(M,1);
m = size(M,2);

depart = [depart;q];

Q = [Q depart];

while condition
    %On regarde tous les points contenus dans Q (la liste permanente)
    b = size(Q,2);
    for i = 1:b
        
        q = Q(3,i)+1;
        %On trouve l indice du point dans Q pour pouvoir utiliser la
        %fonction voisin4
        x = Q(1,i);
        y = Q(2,i);
        indice = n*(y-1)+x;
        
        %On cree la liste temporaire 
        voisins = voisin4(indice,M);
        qv = q*ones(1,4);
        Q_temp = [voisins;qv];
        
        % Verification des <<murs>>: on garde seulement les voisins qui
        % sont de 1
        for j = 1:4 
            if Q_temp(1,j) == 0
                Q_temp(:,j) = [0;0;0;0];
            end
        end
        Q_temp( :, ~any(Q_temp,1) ) = [];  %columns
        % On enleve la premiere ligne de Q_temp qui represente la valeur de
        % carre. 
        Q_temp(1,:) = [];
        
        % Si Q_temp est vide, on ne fait pas une boucle qui le parcour
        if size(Q_temp,2) >0
            % Verification des valeurs repetee dans Q
            for k = 1:size(Q_temp,2)
                x_temp = Q_temp(1,k);
                y_temp = Q_temp(2,k);
                q_temp = Q_temp(3,k);
                
                for t = 1:size(Q,2)
                    x_perm = Q(1,t);
                    y_perm = Q(2,t);
                    q_perm = Q(3,t);
                    % Effacer les coordonnees deja presentes dans Q_perm en
                    % considerant les valeurs de petit q.
                    if x_temp == x_perm && y_temp == y_perm && q_perm <= q_temp
                        Q_temp(:,k) = [0;0;0];
                    end
                end
            end
        % Si Q_temp est vide, il n'y a plus de voisins donc pas de percolation pour ce chemin - on sort du while
        end
        
        % On enleve les colonnes vides de Q_temp
        Q_temp( :, ~any(Q_temp,1) ) = [];
        Q = [Q Q_temp];
        
    end
    
    somme_depart_dans_Q = max(sum(Q(1:2,:)==arrive));
    
    if size(Q,2) == b ||somme_depart_dans_Q == 2
        condition = false;
    end
    
    
   
end
