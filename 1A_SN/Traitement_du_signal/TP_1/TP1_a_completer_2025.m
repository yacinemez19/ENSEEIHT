%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               TP1 de Traitement Num�rique du Signal
%                   SCIENCES DU NUMERIQUE 1A
%                       Fevrier 2025 
%                        Yacine Meziani
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PARAMETRES GENERAUX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A   = 1;        %amplitude du cosinus
f0  = 1100;       %fr�quence du cosinus en Hz
T0  = 1/f0;       %p�riode du cosinus en secondes
N   = 90;        %nombre d'�chantillons souhait�s pour le cosinus
Fe  = 10000;       %fr�quence d'�chantillonnage en Hz
Te  = 1/Fe;       %p�riode d'�chantillonnage en secondes
SNR = "� completer";      %SNR souhait� en dB pour le cosinus bruit�
% Condition de shanon tt ce tmenyik la 

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GENERATION DU COSINUS NUMERIQUE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%D�finition de l'�chelle temporelle
temps = Te * (0:N-1);
%G�n�ration de N �chantillons de cosinus � la fr�quence f0
x=A*cos(2*pi*f0*temps);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TRACE DU COSINUS NUMERIQUE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Sans se pr�occuper de l'�chelle temporelle
figure
plot(x)

%Trac� avec une �chelle temporelle en secondes
%des labels sur les axes et un titre (utilisation de xlabel, ylabel et
%title)
figure
plot(x);
grid
xlabel('Temps (s)')
ylabel('signal')
title(['Trac� d''un cosinus num�rique de fr�quence ' num2str(f0) 'Hz']);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CALCUL DE LA TRANSFORMEE DE FOURIER NUMERIQUE (TFD) DU COSINUS NUMERIQUE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Sans zero padding 
X=fft(x);
%Avec zero padding (ZP : param�tre de zero padding � d�finir)         
ZP = 512;
%size([x, zeros(1, ZP)])
%X_ZP=fft([x, zeros(1, ZP)]);
X_ZP = fft(x, ZP);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TRACE DU MODULE DE LA TFD DU COSINUS NUMERIQUE EN ECHELLE LOG
%SANS PUIS AVEC ZERO PADDING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Avec une �chelle fr�quentielle en Hz
%des labels sur les axes et des titres
%Trac�s en utilisant plusieurs zones de la figure (utilisation de subplot) 
figure('name',['Trac� du module de la TFD d''un cosinus num�rique de fr�quence ' num2str(f0) 'Hz'])

subplot(2,1,1)
echelle_frequentielle=0:Fe/N:Fe*((N-1)/N);
semilogy(echelle_frequentielle, abs(X));
grid
title('Sans zero padding')
xlabel('Fr�quence (Hz)')
ylabel('|TFD|')

subplot(2,1,2)
echelle_frequentielle=0:Fe/(ZP-1):Fe;
semilogy(echelle_frequentielle, abs(X_ZP));
grid
title('Avec zero padding')
xlabel('Fr�quence (Hz)')
ylabel('|TFD|')

%Avec une �chelle fr�quentielle en Hz
%des labels sur les axes et des titres
%Trac�s superpos�s sur une m�me figure 
% (utilisation de hold, de couleurs diff�rentes et de legend)
% !! UTILISER ICI fftshit POUR LE TRACE !!
figure
echelle_frequentielle=-Fe*((N-1)/N)/2:Fe/N:Fe*((N-1)/N)/2;
semilogy(echelle_frequentielle, fftshift(abs(X)),'b');    %Trac� en bleu : 'b'
hold on
echelle_frequentielle=-Fe/2:Fe/(ZP-1):Fe/2;
size(echelle_frequentielle)
size([x,zeros(1, ZP-N)])
semilogy(echelle_frequentielle, fftshift(abs(X_ZP)),'r'); %Trac� en rouge : 'r'
grid
legend('Sans zero padding','Avec zero padding')
xlabel('Fr�quence (Hz)')
ylabel('|TFD|')
title(['Trac� du module de la TFD d''un cosinus num�rique de fr�quence ' num2str(f0) 'Hz'])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CALCUL DE LA TFD DU COSINUS NUMERIQUE AVEC FENETRAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Application de la fen�tre de pond�ration de Hamming
x_fenetre_hamming=x.*hamming(length(x)).';
%Calcul de la TFD pond�r�e, avec zeros padding
X_ZP_hamming=fft("� completer");
%Application de la fen�tre de pond�ration de Blackman
x_fenetre_blackman="� completer";
%Calcul de la TFD pond�r�e, avec zeros padding
X_ZP_blackman=fft("� completer");

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TRACE DU MODULE DE LA TFD DU COSINUS NUMERIQUE AVEC FENETRAGE EN ECHELLE LOG
%POUR DIFFERENTES FENETRES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%"� r�aliser : trac�s superpos�s sur la m�me figure de la TFD non fen�tr�e, 
%de la TFD avec fen�trage de Hamming, de la TFD avec fen�trage de Blackman
%Le tout avec une �chelle fr�quentielle en Hz, un titre, des labels sur les axes, 
%une l�gende et en utilisant fftshift"

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CALCUL DE LA DENSITE SPECTRALE DE PUISSANCE (DSP) DU COSINUS NUMERIQUE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Estimation par p�riodogramme
Sx_periodogramme="� completer";

%Estimation par p�riodogramme de Welch
Sx_Welch=pwelch(x, [],[],[],Fe,'twosided');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TRACE DE LA DENSITE SPECTRALE DE PUISSANCE (DSP) DU COSINUS NUMERIQUE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Trac�s superpos�s sur une m�me figure en utilisant fftshift
%Avec une �chelle fr�quentielle en Hz
%des labels sur les axes, un titre, une l�gende
figure
echelle_frequentielle="� completer";
semilogy("� completer",'b')
hold on
echelle_frequentielle="a completer";
semilogy("� completer",'r')
legend('Periodogramme','Periodogramme de Welch')
xlabel('Fr�quences (Hz)')
ylabel('DSP')
title('Trac�s de la DSP d''un cosinus num�rique de fr�quence 1100 Hz');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CALCUL ET TRACE DE LA FONCTION D'AUTOCORRELATION DU COSINUS BRUITE AVEC LE
%BON SNR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       

%Calcul de la puissance du signal
P_signal=mean(abs(x).^2);
%Calcul de la puissance du bruit pour obtenir le SNR souhait�
P_bruit="� completer";

%G�n�ration du bruit gaussien � la puissance Pb
bruit=sqrt(P_bruit)*randn(1,length(x));
%Ajout du bruit sur le signal
x_bruite=x+bruit;

%Calcul de la fonction d'autocorr�lation du signal bruite
%attention pas le 1/N quand on utilise xcorr => � rajouter
Rx=(1/length(x_bruite))*xcorr(x_bruite); 

%Trac� du signal bruit� avec une �chelle temporelle en secondes
figure
plot("� completer")
grid
xlabel('Temps (s)')
ylabel('Signal')
title('Trac� du cosinus bruit�');

%Trac� de la fonction d'autocorr�lation du signal bruite avec une �chelle 
%temporelle en secondes
figure
echelle_tau="� completer";
plot("� completer")
grid
xlabel('\tau (s)')
ylabel('R_x(\tau)')
title('Trac� de la fonction d''autocorr�lation du cosinus bruit�');

