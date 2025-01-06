% fonction moyenne_normalisee_3v (pour l'exercice 1bis)

function x = moyenne_normalisee_3v(I)

    rvb = I ./ max(1, I(:, :, 1) + I(:, :, 2) + I(:, :, 3));

    R = rvb(:, :, 1);
    size(rvb)
    n = length(I);
    ecart = floor(n * 0.35);

    A = R(1:ecart, :);
    B = R(end-ecart:end, :);
    C = R(ecart:end-ecart,1:ecart);
    D = R(ecart:end-ecart, end-ecart:end);

    Rp = [A(:); B(:); C(:); D(:)];
    Rc = [R(ecart:end-ecart, ecart:end-ecart)];

    Rp_moy = mean(Rp, "all") / length(Rp);
    Rc_moy = mean(Rc, "all") / length(Rc);

    x = [mean(rvb(:, :, 1), "all"); mean(rvb(:,:,2), "all"); Rp_moy - Rc_moy];


end
