function [k]  = R238_246(Te)
    load('../lookup_files/R238-246.mat');
    a1 = par238_246(:,1);
    a2 = par238_246(:,2);
    a3 = par238_246(:,3);
    a4 = par238_246(:,4);
    a5 = par238_246(:,5);
    a6 = par238_246(:,6);
    e = 1.60217e-19;
    k_B = 1.38064e-23;
    T = Te.*(e/k_B)/10^3;  % T' = parametrized T required by the equation 
    k = 1e-6.*exp((a1./T.^a2 + a3./T.^a4 + a5./T.^(2.*a6)));
