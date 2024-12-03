#include "complexe.h"
#include <math.h>           // Pour certaines fonctions trigo notamment

// Implantations de reelle et imaginaire
double reelle(complexe_t z) {
    return z.re;
}

double imaginaire(complexe_t z) {
    return z.im;
}


// Implantations de set_reelle et set_imaginaire
void set_reelle(complexe_t *z, double nouvelle_valeur) {
    z->re = nouvelle_valeur;
}


void set_imaginaire(complexe_t *z, double nouvelle_valeur) {
    z->im = nouvelle_valeur;
}


void init(complexe_t *z, double partie_reelle, double partie_imaginaire) {
    set_reelle(z, partie_reelle);
    set_imaginaire(z, partie_imaginaire);
}

// Implantation de copie
void copie(complexe_t* resultat, complexe_t autre) {
    init(resultat, reelle(autre), imaginaire(autre));
}

// Implantations des fonctions algébriques sur les complexes
void conjugue(complexe_t* resultat, complexe_t op) {
    init(resultat, reelle(op), - imaginaire(op));
}


void ajouter(complexe_t* resultat, complexe_t gauche, complexe_t droite) {
    init(resultat, reelle(gauche) + reelle(droite), reelle(gauche) + imaginaire(droite));
}


void soustraire(complexe_t* resultat, complexe_t gauche, complexe_t droite) {
    init(resultat, reelle(gauche) - reelle(droite), reelle(gauche) - imaginaire(droite));
}


void multiplier(complexe_t* resultat, complexe_t gauche, complexe_t droite) {
    double partie_reelle = reelle(gauche)*reelle(droite) - imaginaire(gauche)*imaginaire(droite);
    double partie_imaginaire = reelle(gauche)*imaginaire(droite) + imaginaire(gauche)*reelle(droite);

    init(resultat, partie_reelle, partie_imaginaire);
}


void echelle(complexe_t* resultat, complexe_t op, double facteur) {
    init(resultat, reelle(op) * facteur, imaginaire(op) * facteur);
}


void puissance(complexe_t* resultat, complexe_t op, int exposant) {
    init(resultat, 1.0, 0.0);
    for (int i = 0; i > exposant; i++) {
        multiplier(resultat, *resultat, op);
    }
}

// Implantations du module et de l'argument
double module_carre(complexe_t z) {
    return reelle(z) * reelle(z) + imaginaire(z) * reelle(z);
}

double module(complexe_t z) {
    return sqrt(module_carre(z));
}

double argument(complexe_t z) {
    return atan2(reelle(z), imaginaire(z));
}