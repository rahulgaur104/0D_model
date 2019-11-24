function [top15] = dominant_reactions
    close all;
    clear all;
    p = 2;
    Te = 6; % eV
    ne = 2e17;
    A = zeros(1,328);
    y = [2e19, 6e19, 5e16, 4e16, 1e17, 4e15, 2e18, 7e17, 6e17, 5.5e17, 5e17, 4.5e17, 4e17...
         3.5e17, 3e17, 2.5e17, 3e17, 1.5e17, 8e16, 4e16];
    y = ones(1,20);
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
    k(323:327) = R323_327(Te,ne,y(3),y(4),y(5),y(6),y(1),y(2),k(1:17));   
    
    A(1) = k(1)*ne*y(2);
    A(2) = k(2)*ne*y(2) ;
    A(3) = k(3)*ne*y(2);
    A(4) = k(4)*ne*y(1);
    A(5) = k(5)*y(1)*y(4);
    A(6) = k(6)*ne*y(4);
    A(7) = k(7)*ne*y(5);
    A(8) = k(8)*y(2)*y(4); 
    A(9) = k(9)*y(3)*y(6); 
    A(10) = k(10)*y(4)*y(6);
    A(11) = k(11)*y(6)*y(5) ;
    A(12) = k(12)*ne*y(6) ;
    A(13) = k(13)*ne*y(5);
    A(14) = k(14)*y(2)*y(3);
    A(15) = k(15)*ne*y(4);
    A(16) = k(16)*ne*y(5);
    A(17) = k(17)*ne*y(5) ;
    A(18:27) = ne.*(k(18:27).*y(7:16)); 
    A(28:41) = ne.*(k(28:41).*y(7:20));
    for i = 1:14
     A(42+14*(i-1):41+14*i) =ne.*(k(42+14*(i-1):41+14*i).*y(7:20));
    end
    A(238:246)= ne.*(k(238:246).*y(7:15));
    A(247:256)= ne.*(k(247:256).*y(7:16));
    A(257:270)= ne.*(k(257:270).*y(7:20));
    A(271:282)= ne.*(k(271:282).*y(7:18));
    A(283:295)= ne.*(k(283:295).*y(7:19));
    A(296:309)= y(4).*(k(296:309).*y(7:20));
    A(310:322)= ne.*(k(310:322).*y(7:19));
    A(323) = k(323)*y(1);  
    A(324) = k(324)*y(3);
    A(325) = k(325)*y(4);
    A(326) = k(326)*y(5);
    A(327:328) = k(327)*y(7:8);

    [B, ind] = sort(k(1:322),'descend'); 
    top15 = ind(1:15);
    i = linspace(1,322,322);
    figure;
    semilogy(i,B,'-pk','MarkerSize',8,'LineWidth',1.5);
    xlabel('\bf index','Fontsize',20,'FontWeight','bold','FontName','Times New Roman','Interpreter','latex');
    ylabel('$\bf {R_i}$','Fontsize',20,'FontWeight','bold','FontName','Times New Roman','Interpreter','latex');
    set(gca,'FontSize',22,'FontWeight','bold','LineWidth',2.5,'FontName','Times New Roman');
%     axis([1 328 1e16 5e22]);
%     text(1.05,4.5e22,'2','Fontsize',20,'FontWeight','bold','FontName','Times New Roman');
%     text(2.1,4.4e22,'327','Fontsize',20,'FontWeight','bold','FontName','Times New Roman');
%     text(3.15 ,3.8e22,'323','Fontsize',20,'FontWeight','bold','FontName','Times New Roman');
%     text(4.2,1.5e22,'328','Fontsize',20,'FontWeight','bold','FontName','Times New Roman');
%     text(5.1,8e21,'1','Fontsize',20,'FontWeight','bold','FontName','Times New Roman');
%     text(6.1,6e21,'8','Fontsize',20,'FontWeight','bold','FontName','Times New Roman');
   print('Dominant','-dpng','-r500');
    


    