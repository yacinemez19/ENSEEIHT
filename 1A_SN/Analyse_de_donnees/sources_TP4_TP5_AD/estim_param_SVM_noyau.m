% fonction estim_param_SVM_noyau (pour l'exercice 3)

function [X_VS,Y_VS,Alpha_VS,c,code_retour] = estim_param_SVM_noyau(X,Y,sigma)

    f = - ones (length(Y), 1);
    K = calcul_noyau(X,X,sigma);
    H_g = Y*Y';
    H = H_g .* K;
    Aeq = Y';
    [alpha, ~, code_retour, ~] = quadprog(H, f, [], [],Aeq, 0, zeros(size(Y)), []);
    
    epsilon = 1e-6;
    condition = alpha > epsilon;
    X_VS = X(condition, :);
    Y_VS = Y(condition);
    Alpha_VS = alpha(condition);
    K_VS = calcul_noyau(X_VS,X,sigma);
    
    c = sum(Alpha_VS .* Y_VS .* K_VS(:,1)) - 1/Y_VS(1);

end
