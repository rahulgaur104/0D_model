function [k] = R310_322(Te)
    clc;
    load('../lookup_files/R310-322_1.mat');
    hold all;
    E = linspace(0,100,500);
    m_e = 9.1e-31;
    k = zeros(1,length(par310_322(1,:)));
%     par310_322_in = zeros(length(E),12);
%     for i = 1 : length(par310_322(1,:))/2
%         A = par310_322(:,2*i-1);
%         j = 1;
%         l = length(par310_322(par310_322(:,2*i-1)~=0));
%         while j <= l
%             b = find(A == par310_322(j,2*i-1));
%             if length(b) > 1
%                 ind = max(b);
%                 add = linspace(0,par310_322(ind+1,2*i-1)-par310_322(ind,2*i-1),ind-j+2);
%                 par310_322(j:ind,2*i-1) = par310_322(j:ind,2*i-1) + add(1:ind-j+1)' ;
%                 j = j + length(b) ;
%             else
%                 j = j + 1;
%             end
%         end
%         %plot(par310_322(:,2*i-1),par310_322(:,2*i));
%         par310_322_in(:,i) = interp1(par310_322(1:l,2*i-1),par310_322(1:l,2*i),E,'linear',0);
%         plot(E,par310_322_in(:,i));
%     end
        for i = 1:length(par310_322(1,:))
            k(i) = 4e-10*sqrt(8/(pi*m_e))/Te^(3/2)*trapz(E,par310_322(:,i)'.*E.*exp(-E./Te));
        end