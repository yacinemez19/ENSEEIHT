% function correlation_contraste (pour exercice_1.m)

function [correlation,contraste] = correlation_contraste(X)

    Xc = X - (mean(X));
    
    Sigma = Xc' * Xc / size(Xc,1);

    variance = diag(Sigma);

    correlation = Sigma ./ sqrt(variance * variance');

    contraste = variance / sum(variance);
end
