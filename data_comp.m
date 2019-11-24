function data_comp
    clear all;
    close all;

     load('data7.mat');
     load('data_P_in.mat');
    %  p = logspace(0,2,28);
    P = linspace(50,5e3,30);
     k_B = 1.39e-23;
     e = 1.6e-19;
     Tg = 600;
    %  Ti_f =@(p) (e/(2*k_B)-600)./p + 600; 
     col = 21;
     T = zeros(28,col);
     %% For electron temperature
     figure;
     plot(P,data(22,:),'-g','MarkerSize',7,'LineWidth',1.75);
     hold all;
     plot(P,data_sam(8,:),'-k','MarkerSize',7,'LineWidth',1.75);
    %  h = legend('Calculated','Samuel & Corr');
    %  set(h,'FontName','Times New Roman','Fontsize',22);
    %  set(gca,'XTick',[0;1e3;2e3;3e3;4e3;5e3],'XTicklabel',num2str(get(gca,'XTick')')...
    % ,'FontSize',22,'FontWeight','bold','LineWidth',2.5,'FontName','Times New Roman');
     xlabel('$\bf P_{in} (W)$','Fontsize',20,'FontWeight','bold','FontName',...
            'Times New Roman','Interpreter','latex');
     ylabel('$\bf T_{e}$($\bf eV$)','Fontsize',20,'FontWeight','bold','FontName',...
            'Times New Roman','Interpreter','latex');
    %  xticks([0 1e3 2e3 3e3 4e3 5e3]);
    %  xticklabels({'0','1e3','2e3','3e3','4e3','5e3'});
     set(gca,'FontSize',22,'FontWeight','bold','LineWidth',2.5,'FontName',...
         'Times New Roman');
     axis([0 5e3 0 10]) 
     print('Figure3a','-dpng','-r500');

     %%  For density of neutral species
     figure;
     semilogy(P,data_sam(1,:),'-or','MarkerSize',7,'LineWidth',1.75);
      hold all;
     semilogy(P,data_sam(2,:),'-ob','MarkerSize',7,'LineWidth',1.75);
     semilogy(P,data(1,:),'-b','MarkerSize',7,'LineWidth',1.75);
    %   hold all;
     semilogy(P,data(2,:),'-r','MarkerSize',7,'LineWidth',1.75);
    %  h = legend('H_2','H');
    %  set(h,'FontName','Times New Roman','Fontsize',22);
     xlabel('$\bf P_{in} (W)$','Fontsize',20,'FontWeight','bold','FontName',...
            'Times New Roman','Interpreter','latex');
     ylabel('\bf n ($\bf m^{-3}$)','Fontsize',20,'FontWeight','bold','FontName',...
            'Times New Roman','Interpreter','latex');
     set(gca,'FontSize',22,'FontWeight','bold','LineWidth',2.5,'FontName',...
             'Times New Roman');
     xlim([0 5e3]);   
     print('Figure3b','-dpng','-r500');

     %% For density of electrically charged species
     figure;
      semilogy(P,data_sam(3,:),'-or','MarkerSize',9,'LineWidth',1.75);
      hold all;
     semilogy(P,data_sam(4,:),'-pg','MarkerSize',9,'LineWidth',1.75);
     semilogy(P,data_sam(5,:),'-sb','MarkerSize',9,'LineWidth',1.75);
     semilogy(P,data_sam(6,:),'-+k','MarkerSize',9,'LineWidth',1.75);
     semilogy(P,data_sam(7,:),'-dm','MarkerSize',9,'LineWidth',1.75);
     semilogy(P,data(3,:),'-r','MarkerSize',9,'LineWidth',1.75);
     semilogy(P,data(4,:),'-g','MarkerSize',9,'LineWidth',1.75);
     semilogy(P,data(5,:),'-b','MarkerSize',9,'LineWidth',1.75);
     semilogy(P,data(6,:)+1e14,'-k','MarkerSize',9,'LineWidth',1.75);
     semilogy(P,data(21,:),'-m','MarkerSize',9,'LineWidth',1.75);
    %   h = legend('{H}^+','{H_2}^+','{H_3}^+','H^-','e');
    %   set(h,'FontName','Times New Roman','Fontsize',22);
     xlabel('$\bf P_{in} (W)$','Fontsize',20,'FontWeight','bold','FontName',...
             'Times New Roman','Interpreter','latex');
     ylabel('\bf n ($\bf m^{-3}$)','Fontsize',20,'FontWeight','bold','FontName',...
            'Times New Roman','Interpreter','latex');
     set(gca,'FontSize',22,'FontWeight','bold','LineWidth',2.5,'FontName',...
          'Times New Roman');
     xlim([0 5e3]);   
     print('Figure3c','-dpng','-r500');

    %% For vibrationally excited species
    %     figure;
    %   loglog(P,data(7,:),'-k','MarkerSize',9,'LineWidth',1.5);
    %   hold all;
    %   loglog(P,data(8,:),'-r','MarkerSize',9,'LineWidth',1.5);
    %   loglog(P,data(9,:),'-g','MarkerSize',9,'LineWidth',1.5);
    %   loglog(P,data(10,:),'-b','MarkerSize',9,'LineWidth',1.5);
    %   loglog(P,data(11,:),'-y','MarkerSize',9,'LineWidth',1.5);
    %   loglog(P,data(12,:),'sk','MarkerSize',9,'LineWidth',1.5);
    %   loglog(P,data(13,:),'sr','MarkerSize',9,'LineWidth',1.5);
    %   loglog(P,data(14,:),'sg','MarkerSize',9,'LineWidth',1.5);
    %   loglog(P,data(15,:),'sb','MarkerSize',9,'LineWidth',1.5);
    %   loglog(P,data(16,:),'sy','MarkerSize',9,'LineWidth',1.5);
    %   loglog(P,data(17,:),'-.k','MarkerSize',9,'LineWidth',1.5);
    %   loglog(P,data(18,:),'-.r','MarkerSize',9,'LineWidth',1.5);
    %   loglog(P,data(19,:),'-.g','MarkerSize',9,'LineWidth',1.5);
    %   loglog(P,data(20,:),'-.b','MarkerSize',9,'LineWidth',1.5);
    % % %   Ti = Ti_f(p);
    % %   T(:,1:2) = Tg;
    % %   T(:,3:6) = [Ti' Ti' Ti' Ti'];
    % %   T(:,7:20)= Tg;
    % %    T(:,col) = data(22,:).*e/k_B;
    % %   figure;
    % %   p_act = sum(data(1:col,:).*T')*k_B;
    % %   plot(p,p_act);