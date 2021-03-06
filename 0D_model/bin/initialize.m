function initialize
%     init = [1e12 1e12 11e12 3e12 5e12 4e12 1e12 2e12 1e12 1e12 1e12 1e12 ...
%             1e12 1e12 1e12 1e12 4e12 7e13 2e11 8e12 1e12 2];
%     init = [1 1 11 3 5 4 1 2 1 1 1 1 1 1 1 1 1 4 1 2 4 1];
%     init(3) = sum(init(4:6))-init(7);
    nH    = 1e19;
    nH2_0 = 2e19;
    %ne    = 1.39e17;
    nHp   = 6e16; 
    nH2p  = 5e16;
    nH3p  = 5e16;
    nHm   = 2e15;
    nH2_1 = 1.2e18;
    nH2_2 = 7e17;
    nH2_3 = 6.5e17;
    nH2_4 = 6e17;
    nH2_5 = 5.5e17;
    nH2_6 = 5e17;
    nH2_7 = 4.5e17 ;
    nH2_8 = 4e17;
    nH2_9 = 3.5e17;
    nH2_10= 3e17;
    nH2_11= 2.5e17;
    nH2_12= 9e16;
    nH2_13= 5e16;
    nH2_14= 2.5e16;
    pe = 3e17;  
    init = [nH nH2_0 nHp nH2p nH3p nHm nH2_1 nH2_2 nH2_3 nH2_4 nH2_5 ...
            nH2_6 nH2_7 nH2_8 nH2_9 nH2_10 nH2_11 nH2_12 nH2_13 nH2_14 ...
            pe]; 
%         p = 1;
%     options = odeset('AbsTol',1e-8,'RelTol',1e-8);
%       [T,Y] = ode15s(@(t,y)mein_solve(t,y,p,0),[0 10],init);
%     p = logspace(0,2,28);
      P = linspace(50,5000,30);
    tic;
    options = odeset('OutputFcn',[]);
    parfor i = 1:length(P)
        ode15s(@(t,y)mein_solve(t,y,i,P(i)),[0 10],init,options);   
        disp('*');
    end
    toc;
%     semilogy(T,Y);
%     data_comp;
%     load('../lookup_files/data2.mat');
