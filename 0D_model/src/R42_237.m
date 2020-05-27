function [par_in1,E] = R42_237
    load('../lookup_files/R42-237.mat');
    hold all;
    E = linspace(0,200,200); % for interpolating other variables.
    % For having a common E we can first interpolate the digitized 
    % data and then intepolate for the vibrational states in between.
    par_in1 = zeros(200*4,15);
    for i = 1:14
        subplot(2,2,1);
        hold on;
        l_0 = length(par42_237_0(par42_237_0(:,2*i-1)>0));
        par0_in = interp1(par42_237_0(1:l_0,2*i-1),par42_237_0(1:l_0,2*i),E,'linear',0); 
        plot(E,par0_in);
        par_in1(1:200,i) = par0_in ;
        subplot(2,2,2);
        hold on;
        l_5 = length(par42_237_5(par42_237_5(:,2*i-1)>0));
        par5_in = interp1(par42_237_5(1:l_5,2*i-1),par42_237_5(1:l_5,2*i),E,'linear',0);
        plot(E,par5_in);
        par_in1(201:400,i) = par5_in;
        subplot(2,2,3);
        hold on;
        l_10 = length(par42_237_10(par42_237_10(:,2*i-1)>0));
        par10_in = interp1(par42_237_10(1:l_10,2*i-1),par42_237_10(1:l_10,2*i),E,'linear',0);
        plot(E,par10_in);
        par_in1(401:600,i)= par10_in;
        subplot(2,2,4);
        hold on;
        l_13 = length(par42_237_13(par42_237_13(:,2*i-1)>0));
        par13_in = interp1(par42_237_13(1:l_13,2*i-1),par42_237_13(1:l_13,2*i),E,'linear',0);
        plot(E,par13_in);  
        par_in1(601:800,i) = par13_in ;              
    end
    i = 15;
    l_0 = length(par42_237_0(par42_237_0(:,2*i-1)>0));
    par0_in = interp1(par42_237_0(1:l_0,2*i-1),par42_237_0(1:l_0,2*i),E,'linear',0);
    par_in1(1:200,i) = par0_in ;
%         par42_237_0(:,2*i) = 1e-20*par42_237_0(:,2*i);
%         par42_237_5(:,2*i) = 1e-20*par42_237_5(:,2*i);
%         par42_237_10(:,2*i) = 1e-20*par42_237_10(:,2*i);
%         par42_237_13(:,2*i) = 1e-20*par42_237_13(:,2*i);
%         save('R42-237.mat')
%     subplot(2,2,1);
%     legend('1','2','3','4','5','6','7','8','9','10','11','12','13','14');
%     subplot(2,2,2);
%     legend('1','2','3','4','5','6','7','8','9','10','11','12','13','14');
%     subplot(2,2,3);
%     legend('1','2','3','4','5','6','7','8','9','10','11','12','13','14');
%     subplot(2,2,4);
%     legend('1','2','3','4','5','6','7','8','9','10','11','12','13','14');
