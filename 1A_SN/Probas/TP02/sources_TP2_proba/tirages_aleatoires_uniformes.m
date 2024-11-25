% Fonction tirages_aleatoires (exercice_2.m)

function [tirages_C,tirages_R] = tirages_aleatoires_uniformes(n_tirages,G,R_moyen)

    tirages_C = (2*R_moyen * rand(n_tirages, 2)) + (G-R_moyen)';
    tirages_R = R_moyen;

end