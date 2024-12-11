% fonction maximisation_classification_SVM_marge (pour l'exercice 5)

function [pourcentage_meilleur_classification_SVM_test, lambda_opt_test, ...
          vecteur_pourcentages_bonnes_classifications_SVM_app, ...
          vecteur_pourcentages_bonnes_classifications_SVM_test] = ...
          maximisation_classification_SVM_marge(X_app,Y_app,X_test,Y_test,vecteur_lambda)

    for i = 1:length(vecteur_lambda)
        [X_VS,w,c,code_retour] = estim_param_SVM_marge(X,Y,vecteur_lambda(i));
    end


    [pourcentage_meilleur_classification_SVM_test, indice] = max(vecteur_pourcentages_bonnes_classifications_SVM_test);
    lambda_opt_test = vecteur_lambda(indice);

end