function dy = mein_solve(t,y,j,P_in)

    dy = zeros(21,1);
    k = zeros(1,327);
    kB = 1.38e-23;  
    me = 9.1e-31;
    e = 1.6e-19;
    chi_01 = 2.405;
    J = besselj(1,chi_01); 
    [p,R,L,Tg,Q_in] = base_pars;
    Ti = (5800 - Tg)/p + Tg;
    nH    = y(1);
    nH2_0 = y(2);
    nHp   = y(3); 
    nH2p  = y(4);
    nH3p  = y(5);
    nHm   = y(6);
    nH2_1 = y(7);
    nH2_2 = y(8);
    nH2_3 = y(9);
    nH2_4 = y(10);
    nH2_5 = y(11);
    nH2_6 = y(12);
    nH2_7 = y(13);
    nH2_8 = y(14);
    nH2_9 = y(15);
    nH2_10= y(16);
    nH2_11= y(17);
    nH2_12= y(18);
    nH2_13= y(19);
    nH2_14= y(20);
    ne    = nHp + nH2p + nH3p - nHm;
    
    K1 = zeros(1,14);
    K2 = zeros(1,14);
    K3 = zeros(1,14);
    K4 = zeros(1,14);
    K5 = zeros(1,14);
    K6 = zeros(1,14);
    K7 = zeros(1,14);
    K8 = zeros(1,14);
    K9 = zeros(1,14);
%     K10 = zeros(1,14);
    Te = y(21)/ne;
    k(1:17) = R1_17(Te);
    k(18:27) = R18_27(Te);       
    k(28:41) = R28_41(Te);       
    k(42:237) = R42_237_in(Te);  
    k(238:246) = R238_246(Te);   
    k(247:256) = R247_256(Te);   
    k(257:270) = R257_270(Te);   
    k(271:282) = R271_282(Te);   
    k(283:295) = R283_295(Te);   
    k(296:309) = R296_309(Te);   
    k(310:322) = R310_322(Te);   
    k(323:327) = R323_327(Te,ne,nHp,nH2p,nH3p,nHm,nH,nH2_0,k(1:17));   
%    k(323:327) = 0;

    K1(1:length(k(18:27)))   =  k(18:27);
    K2(1:length(k(28:41)))  =   k(28:41);
%     K3  = K3 + k(42:237);
    K3(1:length(k(238:246)))  =  k(238:246);
    K4(1:length(k(247:256)))  =  k(247:256);
    K5(1:length(k(257:270)))  =  k(257:270);
    K6(1:length(k(271:282)))  = k(271:282);
    K7(1:length(k(283:295)))  =  k(283:295);
    K8(1:length(k(296:309)))  = k(296:309);
    K9(1:length(k(310:322))) =  k(310:322);
%    K10 = K10 + k(323:327);
    
%     Te    = y(22);
    V = pi*R^2*L ;
    C = 4.47e17*Q_in/V;
%     D = 1.27e-2*Q_in/((p-y(21)*kB)*V)  ;  % 1e3 factor as the pressure is in Torr
      D = 1.27e-2*Q_in/(p*V);
%     K = vibk(k(42:237),vi);
    dy(1) = (2*k(2) + k(3))*ne*nH2_0 + k(6)*ne*nH2p + k(8)*nH2_0*nH2p + 2*k(9)*nHp*nHm ...
            + 3*k(10)*nH2p*nHm + 4*k(11)*nHm*nH3p + k(12)*ne*nHm + (2*k(13)+ 3*k(16)...
            + k(17))*ne*nH3p + 2*k(15)*ne*nH2p + 2*ne*(k(238:246)*y(7:15)) ...
            + 2*ne*(k(247:256)*y(7:16)) + k(257:270)*y(7:20)*ne + k(271:282)*y(7:18)*ne...
            + k(296:309)*y(7:20)*nH2p + 2*k(310:322)*y(7:19)*ne + k(324)*nHp ...
            + k(326)*nH3p - (k(4)*ne*nH + k(5)*nH*nH2p + 2*k(323)*nH)- D*nH ;
        
   dy(2) = k(5)*nH*nH2p + k(17)*ne*nH3p + k(323)*nH + k(325)*nH2p + k(326)*nH3p ...
           + k(327)*nH2_1 - ((k(1) + k(2) + k(3))*ne*nH2_0+ k(8)*nH2_0*nH2p ...
           + k(14)*nH2_0*nHp + sum(k(18:41))*ne*nH2_0) + C - D*nH2_0 ; 
   
%    dy(3) =  k(1)*ne*nH2_0 + k(4)*ne*nH + k(12)*ne*nHm + k(271:282)*y(8:19)*ne ...
%             + k(283:295)*y(8:20) - D ; 
              % This rate equation is only for the case without vibrational states

%    dy(2) = k(5)*nH*nH2p + k(17)*ne*nH3p + k(323)*nH + k(325)*nH2p + k(326)*nH3p ...
%            - ((k(1) + k(2) + k(3))*ne*nH2_0+ k(8)*nH2_0*nH2p  + k(14)*nH2_0*nHp ...
%            + sum(k(18:41))*ne*nH2_0) + C - D*nH2_0 ; 
              % This rate equation is only for the case without vibrational states
              
   dy(3) = k(4)*ne*nH + k(5)*nH*nH2p + k(6)*ne*nH2p + k(271:282)*y(7:18)*ne ...
           + k(13)*ne*nH3p -(k(9)*nHp*nHm + k(14)*nH2_0*nHp + k(324)*nHp) - D*nHp ;
       
   dy(4) = k(1)*ne*nH2_0 + k(7)*ne*nH3p + k(283:295)*y(7:19)*ne - (k(6)*ne*nH2p ...
           + k(325)*nH2p + k(296:309)*y(7:20)*nH2p + k(5)*nH*nH2p + k(8)*nH2_0*nH2p...
           + k(10)*nH2p*nHm + k(15)*ne*nH2p) - D*nH2p;
        
   dy(5) = k(8)*nH2p*nH2_0 + k(14)*nH2_0*nHp + k(296:309)*y(7:20)*nH2p - ((k(7) ...
           + k(13) + k(16) + k(17))*ne*nH3p + k(11)*nHm*nH3p + k(326)*nH3p) - D*nH3p; 
    
   dy(6) = k(3)*ne*nH2_0 + k(7)*ne*nH3p + k(257:270)*y(7:20)*ne - (k(9)*nHp*nHm ...
           + k(10)*nH2p*nHm + k(11)*nH3p*nHm + k(12)*ne*nHm);
              
%    tic; %  tic; and toc are used to time the particular subroutine in a code.
% %     if t > 5e-3
% %         keyboard; % gives control to the keyboard in the middle of a code
% %     end
   for i = 1:14 
       if i < 14
            dy(i+6) = (K1(i) + K2(i))*ne*nH2_0 + vibk(k(42:237),0,i)*y(7:20)*ne ...
                        + k(327)*y(i+7) - (K3(i)*y(i+6)*ne + K4(i)*y(i+6)*ne...
                        + sum(vibk(k(42:237),i,0))*y(i+6)*ne + K5(i)*y(i+6)*ne...
                        + K6(i)*y(i+6)*ne + K7(i)*y(i+6)*ne + K8(i)*y(i+6)*nH2p...
                        + K9(i)*y(i+6)*ne + k(327)*y(i+6)) - D*y(i+6);       
       else
            dy(i+6) = (K1(i) + K2(i))*ne*nH2_0 + vibk(k(42:237),0,i)*y(7:20)*ne ...
                       - (K3(i)*y(i+6)*ne + K4(i)*y(i+6)*ne + sum(vibk(k(42:237),i,0))...
                       *y(i+6)*ne + K5(i)*y(i+6)*ne + K6(i)*y(i+6)*ne ...
                       + K7(i)*y(i+6)*ne + K8(i)*y(i+6)*nH2p + K9(i)*y(i+6)*ne ...
                       + k(327)*y(i+6)) - D*y(i+6); 
                        %Abovementioned code is for the case when pressure constancy 
                        %argument is NOT used
%        if i == 14 
%             dy(i+6) = -(dy(21) + (dy(1)+dy(2))*Tg + Ti.*sum(dy(3:6)) + Tg.*sum(dy(7:20)));
  
%             dy(i+6) = (K1(i) + K2(i))*ne*nH2_0 + vibk(k(42:237),0,i)*y(7:20)*ne + ...
%                      k(327)*y(i+7) - (K3(i)*y(i+6)*ne + K4(i)*y(i+6)*ne + ...
%                      sum(vibk(k(42:237),i,0))*y(i+6)*ne + K5(i)*y(i+6)*ne + ...
%                      K6(i)*y(i+6)*ne + K7(i)*y(i+6)*ne + K8(i)*y(i+6)*nH2p + ...
%                      K9(i)*y(i+6)*ne + k(327)*y(i+6)) - D*y(i+6); 
       end
   end
%    toc;
   
%    load('../lookup_files/Ec_H2.mat');
%    load('../lookup_files/Ec_H.mat');
    load('../lookup_files/Ec+k.mat');
%     load('../lookup_files/Collisional_Energy_Loss.mat');
   load('../lookup_files/EcH.mat');
%    EcH_in = interp1(Ec(:,1),Ec(:,2),Te,'linear',0);
   k_iz_H_in = interp1(T,k_iz_H,Te,'linear',0);
     EcH_in = interp1(T,EcH,Te,'linear',0);
%    EcH2_in = interp1(Ec(:,1),Ec(:,3),Te,'linear',0);
    EcH2_in = interp1(T,EcH2,Te,'linear',0);
   k_iz_H2_in = interp1(T,k_iz_H2,Te,'linear',0);
   e = 1.6e-19;
   gam = Te/Ti*e/kB;
   np = (nHp + nH2p + nH3p);
   nn = nHm;
   alp = nn/ne;                            % electronegativity
   mH = 1.67e-27;
   Mi = 2*mH;                               %  mass of H2+ ion in Kg/molecule
   uB = sqrt(2*e*Te/(Mi*(alp*gam + 1)));
%    uB = sqrt(2*e*Te/Mi);
   eta = 1;
   Ti_ev = Ti*kB/e;
   vi = sqrt(8*e*Ti_ev/(pi*Mi));                     % average ionic velocity

%     vi = sqrt(8*e*Ti_ev/pi)*[nHm nHp nH2p nH3p]... % weighted average ionic velocity
%          *sqrt([2/Mi 2/Mi 1/Mi 2/(3*Mi)])'/(nHm + nHp + nH2p + nH3p);
     
%    lam = 1/(5*p);                  % mean free path(m) for p in Torr
      lam = 1/(1.8e-19*nH + 2.3e-19*nH2_0);
%     lam = 1e20*[nHm nHp nH2p nH3p]*[1/(18*nH + 23*nH2_0), 1/(18*nH + 23*nH2_0),...
%      1/(23*nH + 28*nH2_0), 1/(28*nH + 33*nH2_0)]'/(nHm + nHp + nH2p + nH3p);
    ls_0 = 1/sqrt(chi_01^2/R^2 + pi^2/L^2);
    vth = sqrt(kB*Ti/Mi);
    vH = sqrt(8*kB*Tg/(pi*mH)); 
    D_kn = vi*ls_0/3 ; 
    D_ce = (1.858e-3*600^1.5*sqrt(1.5)*2.5e-5/(1.31e-6*1.37^2*p));
    Di = 1/(1/D_kn + 1/D_ce);
%      Di = pi*vi*lam/8;
    Da = Di*(1+gam + 2*gam*alp)/(1+gam*alp); 
    k_rec = (k(9)+k(10)+k(11))/3;        % positive negative neutralization coefficient
    ns = 15/56*eta^2*vi/(k_rec*lam);    
%     n_s = 15/56*vi/(k_rec*lam);
    h_R0 = 0.80/sqrt(4 + eta*R/lam + (0.8*R*uB/(chi_01*J*Da))^2);
%     h_R0 = 0.80/sqrt(4 + eta*R/lam);
    h_L0 = 0.86/sqrt(3 + eta*L/(2*lam) + (0.86*L*uB/(pi*Da))^2);
%     h_L0 = 0.86/sqrt(3 + eta*L/(2*lam));
%     h_c = 1/(sqrt(gam) + sqrt(gam*ns)*np/nn^1.5); % requires n_p = positive ion density
                                                    % requires n_n = negative ion density
    h_c = 1/(sqrt(gam) + sqrt(gam*ns/nn));                                                 
    hr = sqrt((h_R0/(1+1.5*alp))^2 + h_c^2);
    hl = sqrt((h_L0/(1+1.5*alp))^2 + h_c^2);
    Aeff = 2*pi*(R^2*hl + R*L*hr);
%     uB_av = sqrt(e*Te/mH);
%    uB_av = sqrt(e*Te)*[nHm nHp nH2p nH3p]*sqrt([2/Mi 2/Mi 1/Mi 2/(3*Mi)])'/...
%                (nHm + nHp + nH2p + nH3p);
                                                    % weighted uB for another case 
    Te_K = Te*e/kB;
%     ve = sqrt(8*e*Te/(pi*me)); 
    Ei = log(Mi/(2*pi*me))*Te/2;
%   Ei = 0;
    Es = Ei + Te/2;
   uBH = sqrt(2*e*Te/(Mi*(alp*gam + 1)));
%    uBH = sqrt(2*e*Te/Mi);
   uBH2 = sqrt(e*Te/(Mi*(alp*gam + 1)));
%    uBH2 = sqrt(e*Te/Mi);
   uBH3 = sqrt(2*e*Te/(3*Mi*(alp*gam + 1)));
%    uBH3 = sqrt(2*e*Te/(3*Mi));
%    uBH = sqrt(2*e*Te/Mi);
%    uBH2 = sqrt(e*Te/Mi);
%    uBH3 = sqrt(2*e*Te/3*Mi);
   
   dy(21) = 1/(1.5*e)*(P_in/V + ... 
            - e*ne*(nH*EcH_in*k_iz_H_in + nH2_0*EcH2_in*k_iz_H2_in) ...
            - (uBH*nHp*(Es + 2*Te) + uBH2*nH2p*(Es + 2*Te)...
               +uBH3*nH3p*(Es + 2*Te))*e*Aeff/V);
          

%% Realtime variable monitoring subroutine
         %drawnow;
       if t == .001         
            dummy = 0.1;   % used just to initialize the if else subroutine
       else  
	  disp(t); 
          %figure(1);      % realtime monitoring of the ne and Te so that the code 
                           % can be stopped if some variable goes haywire
          %plot(t,Te,'-ok','MarkerSize',8);
	  %saveas(gcf, 't_vs_Te.png')
          %figure(2);
          %plot(t,ne,'-or','MarkerSize',8);
       end
       
%% Data saving subroutine
%    hold all; 
%             if t >= 6
%                 q = 1;
%             end
%        if t == 10
%         load('../lookup_files/data7.mat');
%         ne    = nHp + nH2p + nH3p - nHm;
%         data(1:20,j) = y(1:20);
%         data(22,j)   = y(21)/ne;
%         data(21,j)   = ne;
%         save('data7.mat','data');
%        end

%% Reinitializing subroutine (Useless now)
% The purpose of this snippet was to reinitialize a variable which is
% performing poorly, such as shooting it up by 2 orders of magnitude
%    z = find( y < 0);
% %    i = 1;
%    if length(z) > 0
%        load('../lookup_files/sup_var.mat');
%        y(z) = sup_var(z);
%        sup_var(z) = sup_var(z)*1.2^(1/length(z));
%        delete('sup_var.mat');
%       save('sup_var.mat','sup_var');
%    end
%    if t > 0.86
%        fprintf('yay');
%    end
%      disp(t);
   
