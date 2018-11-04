
%%% 15 avril 2018
%%% Boisvenue, Étienne
%%% Egner, Karl
%%% Script pour générer un vidéo qui démontre l'évolution des amas pour un
%%% treillis carrées lorsque p augmente progressivement. Pour chaque p, on
%%% ne regénère pas une nouvelle grille, on ne fait remplir certains sites
%%% qui étaient vides. Mettre le plus gros amas dans une couleur bien
%%% différente.

%%% Extension: possiblement faire le meme code avec triangle et hexagone
%%% pour voir pour un meme p comment les différents treillis réagissent

clear all;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
increment(1)=0.10;
increment(2:9)=0.05;
increment(10:24)=0.01;
increment(25:32)=0.05;
n=100;
m=100;
M=zeros(n,m);

%long=length(p);
long=length(increment);
figure();
imagesc(zeros(n,m));
pause(10);
for i=1:long
    posi_zeros=find(M==0);
    nb_zeros=length(posi_zeros);
    nb_un=n*m-nb_zeros;
    
    % On va melanger le vecteur contenant les indices des zéros dans la
    % matrice
    
    rng shuffle;
    shuff=randperm(nb_zeros);
    posi_zeros_shuff=posi_zeros(shuff);
    
    % Je dois maintenant choisir les nombres de zeros que je veux qui
    % deviennent des 1. On fait des incréments de 5% à chaque itération
    
    nb_chang=round(increment(i)*n*m);
    
    % On prend les nb_chang ième premières positions du vecteur posi_zeros
    % et on les changent pour des 1 dans la matrice M
    
    M_copie=M;
    a_changer=posi_zeros_shuff(1:nb_chang);
    M(a_changer)=1;
    percolation=verif_percolation_4(M);
    
    % La soustraction me permet de voir où les 1 ont été ajouté à cette
    % itération-ci
    length(find(M));
    occ=length(find(M))/(n*m);
    L=bwlabel(M,4);
    pond=creation_ponderation(L);
    maximum=max(max(pond));
    imagesc(pond);
    colorbar;
    colormap('jet')
    %
    
    %     % céer le titre
    occ_str=num2str(occ*100);
    max_str=num2str(maximum);
    percolation_str=num2str(percolation);
    s1='Propabilité = ';
    s2='%, maximum = ';
    s3=', Percolation= ';
    set(findall(gcf,'-property','FontSize'),'FontSize',30)
    titre=strcat(s1,occ_str,s2,max_str,s3,percolation_str);
    title(titre)
    pause(1)
    
end
