% fonction classification_MV (pour l'exercice 2)

function Y_pred_MV = classification_MV(X,mu_1,Sigma_1,mu_2,Sigma_2)
    
    modele_V_1 = modelisation_vraisemblance(X,mu_1,Sigma_1);
    modele_V_2 = modelisation_vraisemblance(X,mu_2,Sigma_2);
    Y_pred_MV = ones(size(modele_V_1));
    Y_pred_MV(modele_V_2 >= modele_V_1) = 2;
    
end
