% Fonction estim_param_Dorth_MV (exercice_3.m)

function [theta_Dorth,rho_Dorth] = ...
         estim_param_Dorth_MV(x_donnees_bruitees,y_donnees_bruitees,tirages_theta)

    [x_G, y_G, Xc, Yc] = centrage_des_donnees(x_donnees_bruitees,y_donnees_bruitees);

    Mat = Xc * cos(tirages_theta) + Yc * sin(tirages_theta);
    [~, indice] = min(sum(Mat.^2, 1));

    theta_Dorth = tirages_theta(indice);

    rho_Dorth = x_G * cos(theta_Dorth) + y_G * sin(theta_Dorth);
end