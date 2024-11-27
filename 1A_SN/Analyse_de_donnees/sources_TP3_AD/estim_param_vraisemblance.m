% fonction estim_param_vraisemblance (pour l'exercice 1)

function [mu,Sigma] = estim_param_vraisemblance(X)

   mu = mean(X);
   Xc = X - mu;
   Sigma = 1/length(Xc) * (Xc'*Xc);

end