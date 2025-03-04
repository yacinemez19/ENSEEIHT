%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               TP1 de Traitement Numérique du Signal
%                   SCIENCES DU NUMERIQUE 1A
%                       Fevrier 2025 
%                        Yacine Meziani
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PARAMETRES GENERAUX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A   = 1;          %amplitude du cosinus
f1  = 1000;       %fréquence du cosinus 1 en Hz
f2  = 3000;       %fréquence du cosinus 2 en HZ
T1  = 1/f1;       %période du cosinus 1 
T2  = 1/f2;       %période du cosinus 2 
N   = 100;        %nombre d'échantillons souhaités pour le cosinus
Fe  = 10000;      %fréquence d'échantillonnage en Hz
Te  = 1/Fe;       %période d'échantillonnage en secondes
SNR = "à completer";      %SNR souhaité en dB pour le cosinus bruité 

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GENERATION DU COSINUS NUMERIQUE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Définition de l'échelle temporelle
temps = Te * (0:N-1);
%Génération de N échantillons de cosinus à la fréquence f0
x=A*(cos(2*pi*f1*temps)+cos(2*pi*f2*temps));

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TRACE DU COSINUS NUMERIQUE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Tracé avec une échelle temporelle en secondes
%des labels sur les axes et un titre (utilisation de xlabel, ylabel et
%title)
figure
plot(x);
grid
xlabel('Temps (s)')
ylabel('signal')
title(['Tracé d''une somme de cosinus numériques de fréquence ' num2str(f1) ' et ' num2str(f2) 'Hz']);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CALCUL DE LA TRANSFORMEE DE FOURIER NUMERIQUE (TFD) DU COSINUS NUMERIQUE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Sans zero padding 
N_zp = 512;
X=fft(x, N_zp);
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TRACE DU MODULE DE LA TFD DU COSINUS NUMERIQUE EN ECHELLE LOG
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Avec une échelle fréquentielle en Hz
%des labels sur les axes et des titres
%Tracés en utilisant plusieurs zones de la figure (utilisation de subplot) 
figure('name',['Tracé du module de la TFD d''une somme de cosinus numériques de fréquence ' num2str(f1) ' et ' num2str(f2) 'Hz'])

echelle_frequentielle=-Fe/2:Fe/(N_zp-1):Fe/2;
semilogy(echelle_frequentielle, abs(fftshift(X)));
grid
title(['Tracé du module de la TFD d''une somme de cosinus numériques de fréquence ' num2str(f1) ' et ' num2str(f2) 'Hz'])
xlabel('Fréquence (Hz)')
ylabel('|TFD|')