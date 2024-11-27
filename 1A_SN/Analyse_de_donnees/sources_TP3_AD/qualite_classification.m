% fonction qualite_classification (pour l'exercice 2)

function [pourcentage_bonnes_classifications_total,pourcentage_bonnes_classifications_fibrome, ...
          pourcentage_bonnes_classifications_melanome] = qualite_classification(Y_pred,Y)
    
    nb_fibromes = sum(Y == 1)
    nb_melanones = sum(Y == 2)
    n = length(Y);
    pourcentage_bonnes_classifications_fibrome = sum(Y == 1 & Y_pred == 1)/ nb_fibromes * 100;
    pourcentage_bonnes_classifications_melanome = sum(Y == 2 & Y_pred == 2) / nb_melanones * 100;
    pourcentage_bonnes_classifications_total = (sum(Y == Y_pred))/n * 100;
    n == nb_fibromes + nb_melanones 

end