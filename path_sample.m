% Fonction qui prend une matrice en entrée et vérifie les chemins de
% percolations possible. La sortie est le vecteur qui représente le chemin
% de percolation.

clear all;clc;

M = [1 0 0 0 0 0 0;
     1 1 1 0 0 0 0;
     1 1 1 1 1 0 0;
     0 0 1 1 1 0 0;
     0 1 0 0 1 0 0;
     0 0 0 0 1 1 1;
     1 0 0 0 0 1 1];

condition = true; % Condition de la boucle while
Q = []; % Matrice queue finale
q = 0;
Q_temp = zeros(3,4);

n = size(M,1);
m = size(M,2);

depart = [1;1];
arrivee = [n;m;q];

Q = [Q arrivee];

for var = 1:2
% while condition
    
    %On regarde tous les points contenus dans Q (la liste permanente)
    for i = 1:size(Q,2)
        
        q=Q(3,i)+1;
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
        
        Q_temp(1,:) = [0;0;0];
        
        % Verification des valeurs repetee dans Q
        

        Q = [Q Q_temp];
    end
    condition = false;
end

























%         if size(Q_temp,2)~=0
%             for k = 1:size(Q_temp,2)
%                 x_temp = Q_temp(1,k);
%                 y_temp = Q_temp(2,k);
%                 q_temp = Q_temp(3,k);
%                 for t = 1:size(Q,2)
%                     x_perm = Q(1,t);
%                     y_perm = Q(2,t);
%                     q_perm = Q(3,t);
%                     % Effacer les coordonnees deja presentes dans Q_perm en
%                     % considerant les valeurs de petit q.
%                     if x_temp == x_perm && y_temp == y_perm && q_perm <= q_temp
%                         Q_temp(:,k) = [];
%                     end
%                 end
%             end
%         end
        
