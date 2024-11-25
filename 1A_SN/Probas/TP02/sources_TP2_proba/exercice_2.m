
% Nettoyage de l'espace de travail :
clear; % Vider le workspace
close all; % Fermer toutes les fenetres d'affichage
clc; % Vider la fenetre de commande

% Lancement de l'exercice_1 :
exercice_1;

% Estimation de la position du centre :
n_tirages = 100;
tirages_C = tirages_aleatoires_uniformes(n_tirages,G,R_moyen); % FONCTION A COMPLETER
hold on
C_estime = estimation_C(x_donnees_bruitees,y_donnees_bruitees,tirages_C,R_moyen); % FONCTION A COMPLETER

% Affichage du cercle estime :
theta_cercle = 2*pi/100:2*pi/100:2*pi;
x_cercle_estime = C_estime(1) + R_moyen*cos(theta_cercle);
y_cercle_estime = C_estime(2) + R_moyen*sin(theta_cercle);
plot(x_cercle_estime([1:end 1]),y_cercle_estime([1:end 1]),'g','LineWidth',3);
legend(' Cercle initial', ...
	   ' Donnees bruitees', ...
       ' Estimation avec G et R_{moyen}', ...
	   ' Estimation avec tirages uniformes de C', ...
	   'Location','Best')
   
clear n_tirages theta_cercle x_cercle_estime y_cercle_estime
