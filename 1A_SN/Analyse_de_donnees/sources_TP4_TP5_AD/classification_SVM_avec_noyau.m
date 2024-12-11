% fonction classification_SVM_avec_noyau (pour l'exercice 3)

function Y_pred = classification_SVM_avec_noyau(X,sigma,X_VS,Y_VS,Alpha_VS,c)
    
    K_VS = calcul_noyau(X_VS,X,sigma);
    Y_pred = sign(sum(Alpha_VS .* Y_VS .* K_VS) - c);
    Y_pred = Y_pred';

end