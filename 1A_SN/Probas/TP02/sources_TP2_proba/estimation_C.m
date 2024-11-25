% Fonction estimation_C (exercice_2.m)

function C_estime = estimation_C(x_donnees_bruitees,y_donnees_bruitees,tirages_C,R_moyen)

    X_db = repmat(x_donnees_bruitees.', size(tirages_C, 1), 1);
    Y_db = repmat(y_donnees_bruitees.', size(tirages_C, 1), 1);

    X_c = repmat(tirages_C(:,1), 1, size(x_donnees_bruitees, 1));
    Y_c = repmat(tirages_C(:, 2), 1, size(y_donnees_bruitees, 1));

    distances = sum((sqrt((X_db - X_c).^2 + (Y_db - Y_c).^2) - R_moyen).^2, 2);
    [val_min, ind_min] = min(distances);
    C_estime = tirages_C(ind_min, :);

end