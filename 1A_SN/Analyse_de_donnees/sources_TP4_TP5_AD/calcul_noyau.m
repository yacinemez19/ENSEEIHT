% fonction calcul_noyau (pour l'exercice 3)

function K = calcul_noyau(X1,X2,sigma)
    
    n1 = length(X1);
    n2 = length(X2);

    K = zeros (n1, n2);
    for i = 1:n1
        for j = 1 : n2
            K(i,j) = exp (-norm(X1(i,:) - X2(j, :))^2 / (2*sigma^2));
        end
    end

end