function rate_visual
%     Te = linspace(1,10,100);
    Te = logspace(-2,1.5,50);   % to set the temperature range
    % To remove the comments from multiple lines select all the lines and press
    % Ctrl + T
%     k = zeros(length(Te),17);
%     for i = 1:length(Te)
%         k(i,:) = R1_17(Te(i));
%     end
%     semilogy(Te,k(:,8:14),'LineWidth',2);
%     axis([0 10 1e-22 1e-12]);
%     legend('8','9','10','11','12','13','14')%,'8');...
%     '9','10','11','12','13','14','15','16','17');

%     k18_27 = zeros(length(Te),10);
%     for i = 1:length(Te)
%         k18_27(i,:) = R18_27(Te(i));
%     end
%     semilogy(Te,k18_27);
%     axis([0.01 10 1e-20 1e-12]);
    
%         k28_41 = zeros(length(Te),14);
%     for i = 1:length(Te)
%         k28_41(i,:) = R28_41(Te(i));
%     end
%     semilogy(Te,k28_41);
%     axis([0.01 30 1e-20 1e-12]);

%     for i = 1:length(Te)
%         k42_237(i,:) = R42_237_in(Te(i));
%     end
%     for j = 1:14
%          figure;
%          semilogy(Te,k42_237(:,14*(j-1)+1:14*j),'Linewidth',2);
%             semilogy(Te,k42_237(:,14*(j-1)+1:14*j),'Linewidth',2);
%          axis([0.01 30 1e-20 1e-12]); 
%          legend('1','2','3','4','5','6','7','8','9','10','11','12','13','14');
%     end    

        k247_256 = zeros(length(Te),10);  % Ctrl + T to uncomment
    for i = 1:length(Te)
        k247_256(i,:) = R247_256(Te(i));
    end
    semilogy(Te,k247_256(:,1:6),'Linewidth',2);
    axis([0.1 20 1e-25 1e-12]);
    legend('1','2','3','4','5','6');
 
%         k257_270 = zeros(length(Te),14);
%     for i = 1:length(Te)
%         k257_270(i,:) = R257_270_Janev(Te(i));
%     end
%     semilogy(Te,k257_270(:,1:6),'Linewidth',2);
% %     legend('1','2','3','4','5','6','7','8','9','10','11','12','13','14');
%     legend('1','2','3','4','5','6')%'7','8','9','10','11','12','13','14');
%     axis([0.01 10 1e-20 1e-12]);

%             k271_282 = zeros(length(Te),12);
%        for i = 1:length(Te)
%            k271_282(i,:) = R271_282(Te(i));
%        end
%        semilogy(Te,k271_282);
%        axis([0.01 10 1e-20 1e-12]);

%             k283_295 = zeros(length(Te),13);
%        for i = 1:length(Te)
%            k283_295(i,:) = R283_295(Te(i));
%        end
%        semilogy(Te,k283_295);
%       axis([0.01 10 1e-20 1e-12]);
       
%             k296_309 = zeros(length(Te),14);
%        for i = 1:length(Te)
%            k296_309(i,:) = R296_309(Te(i));
%        end
%        semilogy(Te,k296_309);
%       axis([0.01 10 1e-20 1e-12]);

%             k310_322 = zeros(length(Te),13);
%        for i = 1:length(Te)
%            k310_322(i,:) = R310_322(Te(i));
%        end
%        semilogy(Te,k310_322);

%             ne    = 1.39e17;
%             nHp   = 4e16; 
%             nH2p  = 4e15;
%             nH3p  = 1e17;
%             nHm   = 5e15;
%             k323_327 = zeros(length(Te),5);
%        for i = 1:length(Te)
%            k323_327(i,:) = R323_327(Te(i),ne,nHp,nH2p,nH3p,nHm,nH,nH2);
%        end
%        semilogy(Te,k323_327);


