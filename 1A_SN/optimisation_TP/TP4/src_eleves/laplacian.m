function L = laplacian(nu,dx1,dx2,N1,N2)
%
%  Cette fonction construit la matrice de l'opérateur Laplacien 2D anisotrope
%
%  Inputs
%  ------
%
%  nu : nu=[nu1;nu2], coefficients de diffusivité dans les dierctions x1 et x2. 
%
%  dx1 : pas d'espace dans la direction x1.
%
%  dx2 : pas d'espace dans la direction x2.
%
%  N1 : nombre de points de grille dans la direction x1.
%
%  N2 : nombre de points de grilles dans la direction x2.
%
%  Outputs:
%  -------
%
%  L      : Matrice de l'opérateur Laplacien (dimension N1N2 x N1N2)
%
% 

% Initialisation
L=sparse([]);

b1 = 1/(dx1^2);
b2 = 1/(dx2^2);
a = 2*(b1+b2);

n = N1*N2; % Taille de la matrice
e = ones(n, 1); % Vecteur de 1
B = -b1*ones(n-1, 1);
B(N2: N2: n-1) = 0;
B(n) = 0;
% Construction d'une matrice tridiagonale
L = spdiags([B,-b2*e, a*e, -b2*e, B], [-N2, -1, 0, 1, N2], n, n);
end    
