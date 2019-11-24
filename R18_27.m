function [k] =  R18_27(Te)
    % experimental data fit
    load('R18-27.mat'); % stores the variable par18_27
    a1 = par18_27(:,1);
    a2 = par18_27(:,2);
    a3 = par18_27(:,3);
    a4 = par18_27(:,4);
    a5 = par18_27(:,5);
    a6 = par18_27(:,6);
    e = 1.60217e-19;
    k_B = 1.38064e-23;
    T = Te.*(e/k_B)/10^3;  % T' = parametrized T required by the equation 
    k = exp(a1.*T.^(-a2)+ a3.*T.^(-a4) + a5.*exp(-a6.*log(T)^2))*1e-6; 
                                                        % (cm^3/s -> m^3/s)