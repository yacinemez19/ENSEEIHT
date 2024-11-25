% function ACP (pour exercice_2.m)

function [C,bornes_C,coefficients_RVG2gris] = ACP(X)

    Xc = X - (mean(X));
    
    Sigma = Xc' * Xc / size(Xc,1);

    [W, D] = eig(Sigma);

    [VP_triees, Indices] = sort(diag(D), 'descend');
    
    W_triee = W(:, Indices);

    C =  X * W_triee;

    bornes_C = [min(C, [], 'all') max(C, [], 'all')];

    coefficients_RVG2gris = W_triee(:, 1) / norm(W_triee(:, 1), 1);

end
