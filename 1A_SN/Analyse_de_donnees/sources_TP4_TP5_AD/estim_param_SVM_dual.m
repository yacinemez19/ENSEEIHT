% fonction estim_param_SVM_dual (pour l'exercice 1)

function [X_VS,w,c,code_retour] = estim_param_SVM_dual(X,Y)

    f = - ones (length(Y), 1);
    H_d = X*X';
    H_g = Y*Y';
    H = H_g .* H_d;
    Aeq = Y';
    [alpha, ~, code_retour, ~] = quadprog(H, f, [], [],Aeq, 0, zeros(size(Y)), []);
    
    epsilon = 10^-6;
    condition = alpha > epsilon;
    X_VS = X(condition, :);
    Y_VS = Y(condition);
    Alpha_VS = alpha(condition);

    w = X_VS' * (Alpha_VS .* Y_VS);

    c = X_VS(1, :) * w - 1/Y_VS(1);
end
