clear all; close all;

L1 = 1; L2 = 2;
nu = [1 1];
N1 = 50;
N2 = 50;
dx1 = L1/N1;
dx2 = L2/N2;
nbfig = 1;

% L = kron_laplacian(nu, dx1, dx2, N1, N2);

L = laplacian(nu, dx1, dx2, N1, N2);
size(L)
rhs = forcing(nu, dx1, dx2, N1, N2);
size(rhs)
uh = L\rhs;

nbfig_out = plot_uh(uh, dx1, dx2, N1, N2, nbfig);