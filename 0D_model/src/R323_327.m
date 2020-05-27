function [k] = R323_327(Te,ne,nHp,nH2p,nH3p,nHm,nH,nH2_0,kr)
    [p,R,L,Tg,Q_in] = base_pars;
    Ti = (5800 - Tg)/p + Tg;                % pressure in mTorr
    k = zeros(1,5);
    chi_01 = 2.405;
    J = besselj(1,chi_01); 
    ls_0 = 1/sqrt(chi_01^2/R^2 + pi^2/L^2);% diffusion length scale
%     sigma_12 = 2.3e-19;                  % cross section of H - H2 collision         
    e = 1.6e-19;                           % charge of electron
    kB = 1.39e-23;                         % Boltzman constant 
    nn = nHm;                              % density of negative species
    np = nHp + nH2p + nH3p;                % density of positive species
%     n_e = 1e-20;
    V = pi*R^2*L;                          % Volume of the chamber
    alp = nn/ne;                           % alpha = electronegativity 
    gam = Te/Ti*e/kB;                      % gamma = temp ratio
    gam_H = 0.05;                          % surface recombination coeffs.
    gam_Q = 1;                             % for aluminum chamber.
    mH = 1.67e-27;                         % mass of H atom in kg/atom
    Mi = 2*mH;                             % mass of H2+ ion in kg/molecule
    Ti_ev = kB/e*Ti;
%     lam = 1e-3;                         % mean free path(test value)
%     uB = sqrt(e*Te/mH);                 % Bohm velocity 
    lam = 1e20/(18*nH + 23*nH2_0);        % mean free path for neutral ion collision
    
%     lam = 1e20*[nHm nHp nH2p nH3p]*[1/(18*nH + 23*nH2_0), 1/(18*nH + 23*nH2_0),...
%      1/(23*nH + 28*nH2_0), 1/(28*nH + 33*nH2_0)]'/(nHm + nHp + nH2p + nH3p); ...
                                            % weighted mean free path
    
    vH = sqrt(8*kB*Tg/(pi*mH));        % average velocity of H
    eta = 1 ;                          % eta = 2(T+)/(T- + T+) = 1 since T- = T+
    vi = sqrt(8*e*Ti_ev/(pi*Mi));      % average velocity for ions
%     vi = sqrt(8*e*Ti_ev/pi)*[nHp nH2p nH3p]...   % weighted average velocity
%          *sqrt([2/Mi 1/Mi 2/(3*Mi)])'/( nHp + nH2p + nH3p); 
    D_kn = vi*ls_0/3 ;                 % Knudsen diffusion coefficient 
    D_ce = (1.858e-3*600^1.5*sqrt(1.5)*2.5e-5/(1.31e-6*1.37^2*p)); 
                                       % Chapman-Enskog diffusion coefficient
    Di = 1/(1/D_kn + 1/D_ce);                                 
%     Di = pi*vi*lam/8;                % another expression for diffusion.
    Da = Di*(1+gam + 2*gam*alp)/(1+gam*alp);
    uB = sqrt(2*e*Te/(Mi*(1+alp*gam)));% modified bohm's velocity with 
                                       % elelctronegativity considerations
    k_rec = (kr(9)+kr(10)+kr(11))/3;   % average of all recombination rate constants
    n_s = 15/56*vi/(k_rec*lam);        
    h_R0 = 0.80/sqrt(4 + eta*R/lam + (0.8*R*uB/(chi_01*J*Da))^2);
%     h_R0 = 0.80/sqrt(4 + eta*R/lam); % another expression for the scaling h_R0
    h_L0 = 0.86/sqrt(3 + eta*L/(2*lam) + (0.86*L*uB/(pi*Da))^2);
%     h_L0 = 0.86/sqrt(3 + eta*L/(2*lam)); % another expression for the scaling h_L0
%     h_c = 1/(sqrt(gam) + sqrt(gam*n_s)*np/nn^1.5);% requires np = positive ion density
                                                    % requires nn = negative ion density
                                                    % another exp for h_c
    h_c = 1/(sqrt(gam) + sqrt(gam*n_s/nn));                                                 
    h_R = sqrt((h_R0/(1+1.5*alp))^2 + h_c^2);
    h_L = sqrt((h_L0/(1+1.5*alp))^2 + h_c^2);
%    Tg_ev = kB/e*Tg;                  
    D_kn = vH*ls_0/3 ; 
    D_effH = 1/(1/D_kn + 1/D_ce);   
%      D_effH = pi*vH*lam/8;
     A_eff = 2*pi*(R^2*h_R + R*L*h_L);
    A = 2*pi*(R^2 + R*L);
    k(1) = (ls_0^2/D_effH + 2*V*(2-0.05)/(A*vH*0.05))^-1; % for recombination of H atoms
                                                          % on the wall
    
    %%
    mH2 = 2*mH;                      % mass in kg/mol
    vH2 = sqrt(8*kB*Tg/(pi*mH2));     % average velocity
    D_kn = vH2*ls_0/3 ; 
    D_ce = (1.858e-3*600^1.5*sqrt(1.5)*2.5e-5/(1.31e-6*1.37^2*p));
    D_effH2 = 1/(1/D_kn + 1/D_ce);
%     D_effH2 = pi*vH2*lam/8;
%     A_eff = 2*pi*(R^2*h_R + R*L*h_L);   
    k(5) = (ls_0^2/D_effH2 + 2*V*(2-1)/(A*vH2))^-1;
    
    %%  
    k(2) = sqrt(e*Te/(mH*(alp*gam + 1)))*A_eff/V;    
%     k(2) = sqrt(e*Te/(mH))*A_eff/V;   % another formula for rate constant
                                        % without considering the electronegativity 
                                        % corrections
    k(3) = sqrt(e*Te/(2*mH*(alp*gam + 1)))*A_eff/V;
%     k(3) = sqrt(e*Te/(2*mH))*A_eff/V;
    k(4) = sqrt(e*Te/(3*mH*(alp*gam + 1)))*A_eff/V;
%     k(4) = sqrt(e*Te/(3*mH))*A_eff/V;
   