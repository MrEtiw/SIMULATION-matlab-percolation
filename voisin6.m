%%%17 mars 2018.
%%%Fonction pour déterminer les voisins d'un élément dans une
%%%grille possédant un treillis hexagonal. En input: l'index de l'élément
%%%et la matrice binaire M. 
%%%Output: la matrice v qui contient la valeur de chacun des voisins ainsi
%%%que leur position en x et en y.

function[v]=voisin6(i,M)
%dimensions de la matrice binaire
n = size(M,1);
m = size(M,2);

%identification de la position xy en fonction de l'indice
if mod(i,n) == 0
    x = n;
else
    x = mod(i,n);
end
y = ceil(i/n);

%Peut importe si on est sur une ligne pair ou impair, à droite à gauche en
%haut et en bas sont toujours des voisins
v=zeros(3,6);

%droite
if y+1<=m
    v(1,1) = M(x,y+1);
    v(2,1) = x;
    v(3,1) = y+1;
else
    v(1,1) = 0;
    v(2,1) = 0;
    v(3,1) = 0;
end


% Gauche
if y-1>=1
    v(1,2) = M(x,y-1);
    v(2,2) = x;
    v(3,2) = y-1;
else
    v(1,2) = 0;
    v(2,2) = 0;
    v(3,2) = 0;
end

% Haut
if x-1>=1
    v(1,3) = M(x-1,y);
    v(2,3) = x-1;
    v(3,3) = y;
else
    v(1,3) = 0;
    v(2,3) = 0;
    v(3,3) = 0;
end

% Bas
if x+1<=n
    v(1,4) = M(x+1,y);
    v(2,4) = x+1;
    v(3,4) = y;
else
    v(1,4) = 0;
    v(2,4) = 0;
    v(3,4) = 0;
end



%Si x est impair, les diago seront à gauche
if mod(x,2)==1
    %diagohaut
    if x-1>=1 && y-1>=1
        v(1,5)=M(x-1,y-1);
        v(2,5)=x-1;
        v(3,5)=y-1;
    else
        v(1,5)=0;
        v(2,5)=0;
        v(3,5)=0;
    end
    %diagobas
    if x+1<=n && y-1>=1
        v(1,6)=M(x+1,y-1);
        v(2,6)=x+1;
        v(3,6)=y-1;
    else
        v(1,6)=0;
        v(2,6)=0;
        v(3,6)=0;
    end
    
%Si x est pair, les diago seront à droite    
elseif mod(x,2)==0
    %diagohaut
    if x-1>=1 && y+1<=m
        v(1,5)=M(x-1,y+1);
        v(2,5)=x-1;
        v(3,5)=y+1;
    else
        v(1,5)=0;
        v(2,5)=0;
        v(3,5)=0;
        
    end
    
    if x+1<=n && y+1<=m
        v(1,6)=M(x+1,y+1);
        v(2,6)=x+1;
        v(3,6)=y+1;
    else
        v(1,6)=0;
        v(2,6)=0;
        v(3,6)=0;
    end
        
    
        
        
end



end