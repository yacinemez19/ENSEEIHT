% fonction entrainement_foret (pour l'exercice 2)

function foret = entrainement_foret(X,Y,nb_arbres,proportion_individus)

    foret = cell(1, nb_arbres);
    nb_individus = length(X);
    nb_individus_par_arbre = proportion_individus * nb_individus;
    nb_var = size (X, 2);
    
    for i = 1:nb_arbres
        choix = randperm(nb_individus, nb_individus_par_arbre);
        X_tronque = X(choix, :);
        Y_tronque = Y(choix, :);
        foret{i} = fitctree(X_tronque, Y_tronque, 'NumVariablesToSample', floor (sqrt(nb_var)));
    end
end