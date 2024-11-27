% fonction modelisation_vraisemblance (pour l'exercice 1)

function modele_V = modelisation_vraisemblance(X,mu,Sigma)
    
    Xc = X - mu;
    n = length(Xc);
    k = 1/(2*pi*sqrt(det(Sigma))) ;
    for i = 1:n
        modele_V(i) = k * exp(-1/2*(Xc(i,:))*(Sigma\(Xc(i,:))'));
    end
    modele_V = modele_V';
end