function dy = mein_solve(t,y)
    k = zeros(1,327);
    kB = 1.38e-23;
    dy = zeros(22,1);
    [p,P_in,R,L,Ti,Q_in] = base_pars;
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
    Te = y(22);
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
    k(323:327) = R323_327(Te);   
    
    K1(1:length(k(18:27)))   = K1(1:length(k(18:27))) +  k(18:27);
    K2(1:length(k(28:41)))  = K2(1:length(k(28:41))) + k(28:41);
%     K3  = K3 + k(42:237);
    K3(1:length(k(238:246)))  = K3(1:length(k(238:246))) + k(238:246);
    K4(1:length(k(247:256)))  = K4(1:length(k(247:256))) + k(247:256);
    K5(1:length(k(257:270)))  = K5(1:length(k(257:270))) + k(257:270);
    K6(1:length(k(271:282)))  = K6(1:length(k(271:282))) + k(271:282);
    K7(1:length(k(283:295)))  = K7(1:length(k(283:295))) + k(283:295);
    K8(1:length(k(296:309)))  = K8(1:length(k(296:309))) + k(296:309);
    K9(1:length(k(310:322))) = K9(1:length(k(310:322))) + k(310:322);
%    K10 = K10 + k(323:327);
    
    nH    = y(1);
    nH2_0 = y(2);
    ne    = y(3);
    nHp   = y(4); 
    nH2p  = y(5);
    nH3p  = y(6);
    nHm   = y(7);
    nH2_1 = y(8);
    nH2_2 = y(9);
    nH2_3 = y(10);
    nH2_4 = y(11);
    nH2_5 = y(12);
    nH2_6 = y(13);
    nH2_7 = y(14);
    nH2_8 = y(15);
    nH2_9 = y(16);
    nH2_10= y(17);
    nH2_11= y(18);
    nH2_12= y(19);
    nH2_13= y(20);
    nH2_14= y(21);
%     Te    = y(22);
    V = pi*R^2*L ;
    C = 4.48e17*Q_in/V;
    D = 1.27e-5*Q_in/(p*V);
%     K = vibk(k(42:237),vi);
    dy(1) = (2*k(2) + k(3) + k(6))*y(3)*y(2) + k(8)*y(2)*y(5) + 2*k(9)*y(4)*y(7) + 3*k(10)*y(5)*y(7)...
            + 4*k(11)*y(7)*y(6) + k(12)*y(3)*y(7) + (2*k(13)+ 3*k(16)+ k(17))*y(3)*y(6) + k(15)*y(3)*y(5)...
            + 2*y(3)*(k(238:246)*y(8:16)) + 2*y(3)*(k(247:256)*y(8:17)) + k(257:270)*y(8:21)*y(3) + ...
            k(271:282)*y(8:19)*y(3) + k(296:309)*y(8:21)*y(6) + 2*k(310:322)*y(8:20)*y(3) + k(324)*y(4) +...
            k(326)*y(6) - (k(4)*y(3)*y(1) + k(5)*y(1)*y(5) + 2*k(323)*y(1)^2) - D;
        
   dy(2) = k(5)*nH*nH2p + k(17)*ne*nH3p + k(323)*nH^2 + k(325)*nH2p + k(326)*nH3p + k(327)*nH2_1 - ((k(1) +...
           k(2) + k(3))*ne*nH2_0+ k(8)*nH2_0*nH2p  + k(14)*nH2_0*nHp + sum(k(18:41))*ne*nH2_0) + C - D ; 
   
   dy(3) =  k(1)*ne*nH2_0 + k(4)*ne*nH + k(12)*ne*nHm + k(271:282)*y(8:19)*ne + k(283:295)*y(8:20) +...
           - D ; 
       
   dy(4) = k(4)*ne*nH + k(5)*nH*nH2p + k(6)*ne*nH3p + k(271:282)*y(8:19)*ne + k(13)*ne*nH3p - k(9)*nHp*nHm ...
           - k(14)*nH2_0*nHp - D ;
       
   dy(5) = k(1)*ne*nH2_0 + k(7)*ne*nH3p + k(283:295)*y(8:20)*ne - (k(325)*nH2p + k(296:309)*y(8:21)*nH2p + ...
            k(5)*nH*nH2p + k(8)*nH2_0*nH2p + k(10)*nH2p*nHm + k(15)*ne*nH2p) - D;
        
   dy(6) = k(8)*nH2p*nH2_0 + k(14)*nH2_0*nHp + k(296:309)*y(8:21)*nH2p - (k(6)*ne*nH3p + (k(7) + k(13) + ...
           k(16) + k(17))*ne*nH3p + k(11)*nHm*nH3p + k(16)*ne*nH3p + k(326)*nH3p) - D; 
    
   dy(7) = k(3)*ne*nH2_0 + k(7)*ne*nH3p + k(257:270)*y(8:21) - (k(9)*nHp*nHm + k(10)*nH2p*nHm + ...
           k(11)*nH3p*nHm + k(12)*ne*nHm) - D;
   for i = 1:14   
        dy(i+7) = (K1(i) + K2(i))*ne*nH2_0 + vibk(k(42:237),0,i)*y(8:21)*ne - (K3(i)*y(i+7)*ne + K4(i)*y(i+7)*ne ...
                 + sum(vibk(k(42:237),1,0))*nH2_2*ne + K5(i)*y(i+7)*ne + K6(i)*y(i+7)*ne + K7(i)*y(i+7)*ne + ...
                 + K8(i)*y(i+7)*nH2p + K9(i)*y(i+7)*ne) - D; 
   end
   
   load('Ec_H2.mat');
   load('Ec_H.mat');
   EcH_in = interp1(T,EcH,y(22),'linear',0);
   k_iz_H_in = interp1(T,k_iz_H,y(22),'linear',0);
   EcH2_in = interp1(T,EcH2,y(22),'linear',0);
   k_iz_H2_in = interp1(T,k_iz_H2,y(22),'linear',0);
   e = 1.6e-19;
   alp = Te/Ti;
   np = (nHp + nH2p + nH3p);
   nm = nHm;
   gam = ne/(nHp + nH2p + nH3p);
   M = 2e-3;          % average mass of ions in Kg/mol
   uB = sqrt(e*Te/(M*(alp*gam + 1)));
   eta = 1;
   ve = sqrt(8*kB*Ti/(pi*1e-3));
   vi = ve;
   lam = 1/2e-19*(1/nHp + 1/nH2p + 1/nH3p);
   k_rec = (k(9)+k(10)+k(11))/3;
   ns = 15/56*eta^2*vi/(k_rec*lam); 
   hc = 1/(gam + gam*(sqrt(ns)*np/nm^1.5));
   hl = sqrt((0.86/sqrt(3 + eta*L/(2*lam)*1/(1+1.5*alp)))^2 + hc^2);
   hr = sqrt((0.8/sqrt(4 + eta*R/lam*1/(1+1.5*alp)))^2 + hc^2);
   Aeff = 2*pi*(R^2*hl + R*L*hr);
   uB_av = sqrt(e*Ti/1e-3);
   Ei = log(4*uB_av/ve)*Te;
   Es = Ei + 2*Te;
   
   dy(22) = 1/1.5*e*ne*(P_in/V - 1.5*e*ne*Te*(k(1)*ne*nH2_0 + k(4)*ne*nH + k(12)*ne*nHm + k(271:282)*y(8:19)*ne ...
        + k(283:295)*y(8:20) - D )- e*ne*(nH*EcH_in*k_iz_H_in + nH2_0*EcH2_in*k_iz_H2_in) ...
        - e*uB*(nHp + nH2p + nH3p)*(Es + 2*Te)*Aeff/V) ;

   dy(7) = dy(4) + dy(5) + dy(6) ;
   
