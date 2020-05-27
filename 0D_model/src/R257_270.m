function [k] = R257_270(Te)
    % interpolation w.r.t a common energy scale.
    load('../lookup_files/R257-270.mat');
    m_e = 9.1e-31;
    k = zeros(1,14);
    E = linspace(0,6,400);
    sigma_in = zeros(length(E),14);
    for i = 1:length(par257_270(1,:))/2
        l = length(par257_270(par257_270(:,2*i-1)>0));
        sigma_in(:,i) = interp1(par257_270(1:l,2*i-1),par257_270(1:l,2*i),E,'linear',0);
    end
    sigma_in(:,12) = sigma_in(:,10); % since no suitable extrapolation function could be found
    sigma_in(:,13) = sigma_in(:,11); % the cross section for higher vibrational states have just   
    sigma_in(:,14) = sigma_in(:,12); % been taken to be the same as lower ones.
    
   for i = 1:14
        k(i) = 4e-10*sqrt(8/(pi*m_e))/Te^(3/2)*trapz(E,sigma_in(:,i)'.*E.*exp(-E./Te));
   end
    
    
    