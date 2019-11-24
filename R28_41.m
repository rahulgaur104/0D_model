function [k] =  R28_41(Te)
    % experimental data fit
    load('R28-41.mat'); % stores the variable par28_41
    T = Te./par28_41(:,2);
    k = par28_41(:,1).*(1./T).^(1.5).*exp(-1./T).*1e-15; 
                                          % 1e-9 cm^3/s = 1e-15 m^3/s