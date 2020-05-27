function [k] = R42_237_in(Te)
    % experimental data
    % data conditioning used(extrapolation used for v = 14)
    load('../lookup_files/R42-237_in.mat');
    E = linspace(0,200,200);
    k = zeros(1,196);
    m_e = 9.1e-31;
    for i = 1 : 14
        for j = 1 : 14
            k((i-1)*14 + j) = 4e-10*sqrt(8/(pi*m_e))/Te^(3/2)*...
                   trapz(E,par_in2(200*i+1:200*(i+1),j)'.*E.*exp(-E./Te));
                   % Numerical Maxwellian integration 
        end
    end
