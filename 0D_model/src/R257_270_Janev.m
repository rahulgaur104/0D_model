function [k] = R257_270_Janev(Te)
    k = zeros(1,14);
    load('../lookup_files/R257-270_par.mat');
    k  =  1.972*sigma(:,1).*sqrt(Te)./(1+Te/0.45).*exp(-abs(sigma(:,2))./Te).*...
          (sigma(:,2)./Te + 1/(1+Te/0.45))*1e-14;  
    