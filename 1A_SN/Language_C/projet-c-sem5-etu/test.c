#include "complexe.h"
#include<stdio.h>

int main() {
    complexe_t z;
    init(&z, 2, 3);
    printf("Module(Z) = %f/n", module_carre(z));
    return 0;
}