% fonction estim_moments (pour exercice_3.m)

function [moyennes,ecarts_types] = estim_moments(liste_parametres)

    moyennes = mean(liste_parametres, 2);
    ecarts_types = std(liste, 1, 2);

end
