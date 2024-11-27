% fonction maximisation_classification_MAP (pour l'exercice 3)

function [pourcentage_meilleur_classification_MAP, p1_max, ...
          vecteur_pourcentages_bonnes_classifications_MAP] = ...
         maximisation_classification_MAP(X,Y,valeurs_p1,mu_1,Sigma_1,mu_2,Sigma_2)
    
    vecteur_pourcentages_bonnes_classifications_MAP = zeros(size(valeurs_p1));
    for i = 1:length(valeurs_p1)
        Y_pred = classification_MAP(X,valeurs_p1(i),mu_1,Sigma_1,mu_2,Sigma_2);
        [vecteur_pourcentages_bonnes_classifications_MAP(i), ~, ~] = qualite_classification(Y_pred,Y);
    end
    
    pourcentage_meilleur_classification_MAP = max(vecteur_pourcentages_bonnes_classifications_MAP);
end
