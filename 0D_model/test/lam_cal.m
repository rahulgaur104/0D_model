function lam_cal

%function to calculate the mean free paths of various species for the first order
%reactions.
% Run only when you have defined all variables given below after uploading data7.mat

lam_H = 1/(18*nH + 23*nH2_0);
lam_H2 = 1/(23*nH + 28*nH2_0);
lam_Hp  = 1/(18*nH + 23*nH2_0);
lam_Hm  = 1/(18*nH + 23*nH2_0);
lam_H2p  = 1/(23*nH + 28*nH2_0);
lam_H3p  = 1/(28*nH + 33*nH2_0);
lam_i = nHp*lam_Hp + nHm*lam_Hm + nH2p*lam_H2p + nH3p*lam_H3p/(nHp + nHm + nH2p + nH3p);

