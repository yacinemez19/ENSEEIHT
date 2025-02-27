
% Nettoyage de l'espace de travail :
clear; % Vider le workspace
close all; % Fermer toutes les fenetres d'affichage
clc; % Vider la fenetre de commande

% Recuperation de la taille de l'ecran pour afficher les figures :
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Lecture d'une image interne a Matlab et conversion en niveaux de gris et en doubles :
I = double(rgb2gray(imread('autumn.tif')));

% Affichage de l'image d'origine :
figure('Position',[0.05*L,0.1*H,0.9*L,0.7*H],'Color',[0.7 0.75 0.85]);
subplot(1,2,1)
    imagesc(I);
    axis image off;
    colormap gray;
    set(gca,'FontSize',15);
    title('Image d''origine')

% Calcul de vecteurs contenant les niveaux de gris de gauche (de droite) d'une paire de pixels :
[Vd,Vg] = vectorisation_par_colonne(I); % FONCTION A COMPLETER

% Affichage des paires de niveaux de gris sous la forme d'un nuage de points :
subplot(1,2,2)
    plot(Vd,Vg,'b+');
    axis([0 255 0 255]);
    xlabel('Niveau de gris du pixel de droite');
    ylabel('Niveau de gris du pixel de gauche');
    hold on;
    set(gca,'FontSize',15);
    axis equal;
    grid on;
    
% Calcul des parametres de la droite de regression :
[r,a,b] = parametres_correlation(Vd,Vg); % FONCTION A COMPLETER

% Affichage de la droite de regression (d'equation y = a*x+b) :
x = 0:255;
y = a*x+b;
plot(x,y,'r','LineWidth',3);
title(['Correlation entre pixels voisins : ' num2str(100*r,'%.1f') '%'])
