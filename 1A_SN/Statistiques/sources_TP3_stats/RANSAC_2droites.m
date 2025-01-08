% Fonction RANSAC_2droites (exercice_2.m)

function [rho_F_estime,theta_F_estime] = RANSAC_2droites(rho,theta,parametres)

    % Parametres de l'algorithme RANSAC :
    S_ecart = parametres(1); % seuil pour l'ecart
    S_prop = parametres(2); % seuil pour la proportion
    k_max = parametres(3); % nombre d'iterations
    n_donnees = length(rho);
    ecart_moyen_min = Inf;


    for i = 1:k_max 
        i_droites = randperm(n_donnees, 2);

        [rho_Pf1,theta_Pf1, ~] = estim_param_F(rho(i_droites), theta(i_droites));
                
        % Calcul des droites proches
        proches = (abs(rho_Pf1 - rho .* cos(theta - theta_Pf1)) < S_ecart);
        rho_droites_proches = rho(proches);
        theta_droites_proches = theta(proches);
        

        prop_droites = length(rho_droites_proches) / n_donnees;
        length(rho_droites_proches)

        if prop_droites > S_prop 
            [rho_Pf2,theta_Pf2, ecart_Pf2] = estim_param_F(rho_droites_proches, theta_droites_proches);

            if ecart_Pf2 < ecart_moyen_min 
                ecart_moyen_min = ecart_Pf2;
                rho_F_estime = rho_Pf2;
                theta_F_estime = theta_Pf2;
            end
        end
    end

end