% fonction classification_foret (pour l'exercice 2)

function Y_pred = classification_foret(foret, X)

    Y_tab = zeros(length(X), length(foret));
    for i = 1:length(foret)
        Y_tab(:, i) = classification_arbre(foret{i},X);
    end
    Y_pred = mode (Y_tab, 2);
    size(Y_pred)
end