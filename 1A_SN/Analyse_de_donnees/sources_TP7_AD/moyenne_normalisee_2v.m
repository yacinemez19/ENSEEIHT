% fonction moyenne_normalisee_2v (pour l'exercice 1)

function x = moyenne_normalisee_2v(I)
    
    rvb = I ./ max(1, I(:, :, 1) + I(:, :, 2) + I(:, :, 3));
    x = [mean(rvb(:, :, 1), "all"); mean(rvb(:,:,2), "all")];

end
