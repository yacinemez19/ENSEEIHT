% fonction estim_param_SVM_marge (pour l'exercice 2)

function [X_VS,w,c,code_retour] = estim_param_SVM_marge(X,Y,lambda)

    f = - ones (length(Y), 1);
    H_d = X*X';
    H_g = Y*Y';
    H = H_g .* H_d;
    Aeq = Y';
    [alpha, ~, code_retour, ~] = quadprog(H, f, [], [],Aeq, 0, zeros(size(Y)), ones(size(Y)) * lambda);
    
    epsilon = 10^-6;

    X_VS = X(alpha > epsilon & alpha < lambda, :);
    
    w = X' * (alpha .* Y);

    Y_VS = Y(alpha > epsilon & alpha < lambda);

    c = X_VS(1, :) * w - 1/Y_VS(1);

end