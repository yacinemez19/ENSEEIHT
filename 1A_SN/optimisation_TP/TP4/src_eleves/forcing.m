function b=forcing(nu, dx1, dx2, N1, N2)
%
%  Cette fonction construit le vecteur de forçage de l'EDP
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
%  b      : vecteur de forçage (dimension N1N2)
%
% 

% Initialisation
X_1 = linspace(0, N1*dx1, N1);
X_2 = linspace(0, N2*dx2, N2);
b = - 1 + sin(X_1'*X2);
%b = - randn(N1*N2,1) - 0.5;
%b=-ones(N1*N2,1);

%%%%%%%%%%%%%%%%%%%%%%
%%%%%% TO DO %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%

end
