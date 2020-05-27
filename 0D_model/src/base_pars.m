function [p,R,L,Tg,Q_in] = base_pars
    Q_in = 50;  % volume inflow rate sccm(cm^3/min)
    p = 10 ;  % pressure in mTorr
%     P_in = 1000; % power input in W
    R = 0.049;    % radius of the chamber(m)
%     R = 0.25;
    L = 1;     % length of the chamber 
    Tg = 600;   % neutral gas temperature in K
    
%% Tentative experimental parameters
%     Q_in = 50;  % volume inflow rate sccm(cm^3/min)
%     p = 10 ;  % pressure in mTorr
%     P_in = 600; % power input in W
%     R = 0.1524;    % radius of the chamber(m)
%     L = 0.0762 ;     % length of the chamber 
%     Tg = 500;   % neutral gas temperature in K

%     Ti = (5800 - Tg)/p + Tg;
