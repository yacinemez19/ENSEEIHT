% fonction estim_param_SVM_noyau_marge (pour l'exercice 4)

function [X_VS,Y_VS,Alpha_VS,c,code_retour] = estim_param_SVM_noyau_marge(X,Y,sigma,lambda)

    f = - ones (length(Y), 1);
    K = calcul_noyau(X,X,sigma);
    H_g = Y*Y';
    H = H_g .* K;
    Aeq = Y';
    [alpha, ~, code_retour, ~] = quadprog(H, f, [], [],Aeq, 0, zeros(size(Y)), ones(size(Y)) * lambda);
    
    epsilon = 10^-6;
    condition = alpha > epsilon;
    X_VS = X(condition, :);
    Y_VS = Y(condition);
    Alpha_VS = alpha(condition);
    K_VS = calcul_noyau(X_VS,X,sigma);
    
    c = sum(Alpha_VS .* Y_VS .* K_VS(:,1)) - 1/Y_VS(1);

end
