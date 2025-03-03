% Fonction permettant de générer un vecteur avec N échantillons de cosinus

function [vect_cos] = generer_cos(n, amplitude, f0, Fe)
    t = (1/Fe)*(1:n);   
    vect_cos = amplitude*cos(t*2*pi*f0);
end