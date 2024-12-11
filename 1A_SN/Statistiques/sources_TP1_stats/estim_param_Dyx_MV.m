% Fonction estim_param_Dyx_MV (exercice_1.m)

function [a_Dyx,b_Dyx,residus_Dyx] = ...
           estim_param_Dyx_MV(x_donnees_bruitees,y_donnees_bruitees,tirages_psi)

    [x_G, y_G, X, Y] = centrage_des_donnees(x_donnees_bruitees,y_donnees_bruitees);

    tan_psi = tan(tirages_psi);

    Mat = (Y - X * tan_psi).^2;

    [~, indice] = min(sum(Mat, 1));

    a_Dyx = tan_psi(indice);

    b_Dyx = y_G - a_Dyx * x_G;

    residus_Dyx = Y - tan_psi(indice) * X;
end