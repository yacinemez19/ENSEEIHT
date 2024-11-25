% fonction estim_param_MC_paire (pour exercice_2.m)

function parametres = estim_param_MC_paire(d,x,y_inf,y_sup)
    
    presque_quart_de_matrice = zeros(size(x, 1), d - 1);
    mat_Bernstein = presque_quart_de_matrice;
    for k = 1: d - 1
        mat_Bernstein(:, k) = vecteur_bernstein(x, d, k);
    end
    
    A = [mat_Bernstein presque_quart_de_matrice vecteur_bernstein(x, d, d);
         presque_quart_de_matrice mat_Bernstein vecteur_bernstein(x, d, d)];

    B = [y_inf - y_inf(1)*vecteur_bernstein(x, d, 0) ; y_sup - y_sup(1)*vecteur_bernstein(x, d, 0)];

    parametres = A \ B;

end
