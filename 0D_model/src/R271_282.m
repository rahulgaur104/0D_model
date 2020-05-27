function [k] = R271_282(Te)
    E = linspace(1e-2,200,200);
    load('../lookup_files/R271_282.mat');
    k = zeros(1,12);
    m_e = 9.1e-31;
    e = 1.60217e-19;
    k_B = 1.38064e-23;
    Ev0 = 30.6;
    for i = 1:12
        
        C1 = par271_282(i,1);
        C2 = par271_282(i,2);
        C3 = par271_282(i,3);
        C4 = par271_282(i,4);
        C5 = par271_282(i,5);
        
        T = Te*e/(1e3*k_B);
        
        k(i) = exp(C1/T^C2 + C3 + C4*exp(-C5*T))*1e-6;
        % assumption : that the rate given in Janev is in cm^3
    end                                                       
