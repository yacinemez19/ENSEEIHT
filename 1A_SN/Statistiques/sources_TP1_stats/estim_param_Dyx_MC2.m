% Fonction estim_param_Dyx_MC2 (exercice_2bis.m)

function [a_Dyx,b_Dyx,coeff_r2] = ...
                   estim_param_Dyx_MC2(x_donnees_bruitees,y_donnees_bruitees)
    
    [x_G, y_G, Xc, Yc] = ...
                centrage_des_donnees(x_donnees_bruitees,y_donnees_bruitees);

	n = length(Xc);
    var_X = 1/n * sum(Xc.^2);
    var_Y = 1/n * sum(Yc.^2);
    cov_XY = 1/n * sum(Xc .* Yc);

    r = cov_XY / sqrt(var_X * var_Y);
    a_Dyx = r * sqrt(var_Y/var_X);
    b_Dyx = y_G - a_Dyx * x_G;
    coeff_r2 = r^2;
end