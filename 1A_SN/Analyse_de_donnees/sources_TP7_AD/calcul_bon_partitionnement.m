% fonction calcul_bon_partitionnement (pour l'exercice 1)

function meilleur_pourcentage_partitionnement = calcul_bon_partitionnement(Y_pred,Y)
    nb_possibilites = max(Y);
    permutations = perms(1:nb_possibilites);
    meilleur_pourcentage_partitionnement = 0;

    for permutation = permutations' 
        Y_test = zeros(size(Y_pred));
        for i = 1:nb_possibilites
            Y_test(Y_pred == permutation(i)) = i;
        end
        test_pourcentage = sum (Y_test == Y);
        meilleur_pourcentage_partitionnement = max (meilleur_pourcentage_partitionnement, test_pourcentage);
    end
    
    meilleur_pourcentage_partitionnement = 100 * (meilleur_pourcentage_partitionnement / length(Y));
end