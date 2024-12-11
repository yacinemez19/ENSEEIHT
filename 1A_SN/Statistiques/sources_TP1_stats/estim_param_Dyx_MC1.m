% Fonction estim_param_Dyx_MC1 (exercice_2.m)

function [a_Dyx,b_Dyx,coeff_R2] = ...
                   estim_param_Dyx_MC1(x_donnees_bruitees,y_donnees_bruitees)
    
    n = length(x_donnees_bruitees);
    A = [x_donnees_bruitees ones(n, 1)];
    B = y_donnees_bruitees;

    X = A\B;
    a_Dyx = X(1);
    b_Dyx = X(2);

    SCR = sum((y_donnees_bruitees - a_Dyx * x_donnees_bruitees - b_Dyx).^2);
    y_G = 1/n * sum(y_donnees_bruitees);
    SCT = sum((y_donnees_bruitees - y_G).^2);
    coeff_R2 = 1 - SCR/SCT;
end