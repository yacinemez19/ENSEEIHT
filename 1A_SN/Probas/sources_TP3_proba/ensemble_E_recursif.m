% Fonction ensemble_E_recursif (exercie_1.m)

function [E,contour,G_somme] = ensemble_E_recursif(E,contour,G_somme,i,j,...
                                                   voisins,G_x,G_y,card_max,cos_alpha)

    % Mise à 0 de la valeur contour du pixel courant pour ne pas retourner dessus
    contour(i,j) = 0;
    % Nombre de voisins (ici 8)
    nb_voisins = size(voisins,1);
    % Initialisation du comptage des 8 voisins a parcourir
    k = 1;
    while k < nb_voisins && size (E,1) < card_max
        %Selection pixel voisin
        i_voisin_k = i + voisins(k, 1);
        j_voisin_k = j + voisins(k, 2);
        
        % On test s'il est sur le contour
        if contour(i_voisin_k, j_voisin_k) == 1
            % Recup. gradient
            G_voisin = [G_x(i_voisin_k, j_voisin_k), G_y(i_voisin_k, j_voisin_k)];
            % Test orientation 
            if (G_somme/norm(G_somme)) * (G_voisin/norm(G_voisin)).'  >= cos_alpha
                % Ajout voisin dans E
                E = [E; [i_voisin_k, j_voisin_k]];
                % Ajouter G_voisin à la somme
                G_somme = G_somme + G_voisin;
                [E, contour, G_somme] = ensemble_E_recursif(E, contour, G_somme, i_voisin_k, j_voisin_k, voisins, G_x, G_y, card_max, cos_alpha);
            end
        end
        k = k + 1;
    end
end