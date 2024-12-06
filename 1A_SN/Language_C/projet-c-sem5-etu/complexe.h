#ifndef COMPLEX_H
#define COMPLEX_H

// Type utilisateur complexe_t
typedef struct{
    double re;
    double im;
} complexe_t;

// Fonctions reelle et imaginaire
/**
 * reelle
 * Renvoie la partie réelle du nombre complexe donné en entrée
 *
 * Paramètres :
 *   z          [in]  Complexe dont on cherche la partie réelle
 *
 * Retour : Re(z), la partie réelle du nombre complexe
 * 
 * Pré-conditions : z non null
 * Post-conditions : resultat = z.re
 */
double reelle(complexe_t z);

/**
 * imaginaire
 * Renvoie la partie imaginaire du nombre complexe donné en entrée
 *
 * Paramètres :
 *   z          [in]  Complexe dont on cherche la partie imaginaire
 *
 * Retour : Im(z), la partie imaginaire du nombre complexe
 * 
 * Pré-conditions : z non null
 * Post-condition : resultat = z.im
 **/
double imaginaire(complexe_t z);

// Procédures set_reelle, set_imaginaire et init
/**
 * set_reelle
 * Modifie la partie réelle du nombre complexe donné avec le nombre réel
 * donné (dans cet ordre)
 * 
 * Paramètres :
 *   z                  [in out]  Complexe dont on veut modifier la partie réelle
 *   nouvelle_valeur    [in]      Nouvelle partie réelle
 * 
 * Pré-conditions : z non null et nouvelle_valeur non nulle
 * Post-condition : reelle(z) = nouvelle_valeur
 */
void set_reelle(complexe_t *z, double nouvelle_valeur);

/**
 * set_imaginaire
 * Modifie la partie imaginaire du nombre complexe donné avec le nombre réel
 * donné (dans cet ordre)
 * 
 * Paramètres :
 *   z                  [in out]  Complexe dont on veut modifier la partie imaginaire
 *   nouvelle_valeur    [in]      Nouvelle partie imaginaire
 * 
 * Pré-conditions : z non null et nouvelle_valeur non nulle
 * Post-condition : imaginaire(z) = nouvelle_valeur
 */
void set_imaginaire(complexe_t *z, double nouvelle_valeur);

/**
 * init
 * Modifie la partie réelle et la partie imaginaire du nombre complexe donné
 * avec les deux réels donnés (partie réelle puis imaginaire, dans cet ordre)
 * 
 * Paramètres :
 *   z                  [out]       Complexe qu'on veut modifier
 *   partie_reelle      [in]        Nouvelle partie imaginaire
 *   partie_imaginaire  [in]        Nouvelle partie imaginaire
 * 
 * Pré-conditions : z non null et partie_reelle et partie_imaginaire non nulles
 * Post-condition : reelle(z) = partie_reelle et imaginaire(z) = partie_imaginaire
 */
void init(complexe_t *z, double partie_reelle, double partie_imaginaire);

// Procédure copie
/**
 * copie
 * Copie les composantes du complexe donné en second argument dans celles du premier
 * argument
 *
 * Paramètres :
 *   resultat       [out] Complexe dans lequel copier les composantes
 *   autre          [in]  Complexe à copier
 *
 * Pré-conditions : resultat non null
 * Post-conditions : resultat et autre ont les mêmes composantes
 */
void copie(complexe_t* resultat, complexe_t autre);

// Algèbre des nombres complexes
/**
 * conjugue
 * Calcule le conjugué du nombre complexe op et le sotocke dans resultat.
 *
 * Paramètres :
 *   resultat       [out] Résultat de l'opération
 *   op             [in]  Complexe dont on veut le conjugué
 *
 * Pré-conditions : resultat non-null
 * Post-conditions : reelle(*resultat) = reelle(op), complexe(*resultat) = - complexe(op)
 */
void conjugue(complexe_t* resultat, complexe_t op);

/**
 * ajouter
 * Réalise l'addition des deux nombres complexes gauche et droite et stocke le résultat
 * dans resultat.
 *
 * Paramètres :
 *   resultat       [out] Résultat de l'opération
 *   gauche         [in]  Opérande gauche
 *   droite         [in]  Opérande droite
 *
 * Pré-conditions : resultat non-null
 * Post-conditions : *resultat = gauche + droite
 */
void ajouter(complexe_t* resultat, complexe_t gauche, complexe_t droite);

/**
 * soustraire
 * Réalise la soustraction des deux nombres complexes gauche et droite et stocke le résultat
 * dans resultat.
 *
 * Paramètres :
 *   resultat       [out] Résultat de l'opération
 *   gauche         [in]  Opérande gauche
 *   droite         [in]  Opérande droite
 *
 * Pré-conditions : resultat non-null
 * Post-conditions : *resultat = gauche - droite
 */
void soustraire(complexe_t* resultat, complexe_t gauche, complexe_t droite);

/**
 * multiplier
 * Réalise le produit des deux nombres complexes gauche et droite et stocke le résultat
 * dans resultat.
 *
 * Paramètres :
 *   resultat       [out] Résultat de l'opération
 *   gauche         [in]  Opérande gauche
 *   droite         [in]  Opérande droite
 *
 * Pré-conditions : resultat non-null
 * Post-conditions : *resultat = gauche * droite
 */
void multiplier(complexe_t* resultat, complexe_t gauche, complexe_t droite);

/**
 * echelle
 * Calcule la mise à l'échelle d'un nombre complexe avec le nombre réel donné (multiplication
 * de op par le facteur réel facteur).
 *
 * Paramètres :
 *   resultat       [out] Résultat de l'opération
 *   op             [in]  Complexe à mettre à l'échelle
 *   facteur        [in]  Nombre réel à multiplier
 *
 * Pré-conditions : resultat non-null
 * Post-conditions : *resultat = op * facteur
 */
void echelle(complexe_t* resultat, complexe_t op, double facteur);

/**
 * puissance
 * Calcule la puissance entière du complexe donné et stocke le résultat dans resultat.
 *
 * Paramètres :
 *   resultat       [out] Résultat de l'opération
 *   op             [in]  Complexe dont on veut la puissance
 *   exposant       [in]  Exposant de la puissance
 *
 * Pré-conditions : resultat non-null, exposant >= 0
 * Post-conditions : *resultat = op * op * ... * op
 *                                 { n fois }
 */
void puissance(complexe_t* resultat, complexe_t op, int exposant);

// Module et argument
/**
 * module_carre
 * Renvoie le module au carré du nombre complexe donné en entrée
 *
 * Paramètres :
 *   z          [in]  Complexe dont on cherche le module au carré
 *
 * Retour : |z|^2, module au carré de z
 * 
 * Pré-conditions : z non null
 * Post-conditions : resultat = reelle(z)^2 + imagianaire(z)^2
 */
double module_carre(complexe_t z);

/**
 * module
 * Renvoie le module du nombre complexe donné en entrée
 *
 * Paramètres :
 *   z          [in]  Complexe dont on cherche le module
 *
 * Retour : |z|, module de z
 * 
 * Pré-conditions : z non null
 * Post-conditions : resultat = sqrt(module_carré(z))
 */
double module(complexe_t z);

/**
 * argument
 * Renvoie l'argument du nombre complexe donné en entrée
 *
 * Paramètres :
 *   z          [in]  Complexe dont on cherche l'argument
 *
 * Retour : arg(z), argument de z
 * 
 * Pré-conditions : z non null
 * Post-conditions : z = module(z) * (cos(resultat) + i * sin (résultat))
 */
double argument(complexe_t z);


#endif // COMPLEXE_H