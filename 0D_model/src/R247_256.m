function [k]  = R247_256(Te)
    load('../lookup_files/R247-256.mat');
    a1 = par247_256(:,1);
    a2 = par247_256(:,2);
    a3 = par247_256(:,3);
    a4 = par247_256(:,4);
    a5 = par247_256(:,5);
    a6 = par247_256(:,6);
    e = 1.60217e-19;
    k_B = 1.38064e-23;
    T = Te.*(e/k_B)/10^3;  % T' = parametrized T required by the equation 
    ki = 1e-6.*exp(a1./T.^a2 + a3./T.^a4 + a5./T.^(2.*a6));
%% interpolation(linear) subroutine
    for i = 1:10
        if i <= 3 
            k(i) = ki(1) + (ki(2)-ki(1))*i/3 ;
        elseif i > 3 && i <= 6
            k(i) = ki(2) + (ki(3)-ki(2))*(i-3)/3 ;
        elseif i > 6 && i <= 9
            k(i) = ki(3) + (ki(4)-ki(3))*(i-6)/3 ;
        else
            k(i) =  ki(4) + (ki(5)-ki(4))*(i-9)/3 ;
        end
    end
    k(k<0) = 0; % nulling the negative entries 
    
    
