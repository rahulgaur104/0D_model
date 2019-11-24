function [par257_270_in] = mono_rem
    % subroutine to remove the monotony of the independent variable so as to 
    % aid in interpolation 
    clear all;
    clc;
    load('R257-270.mat');
    hold all;
    E = linspace(0,5,500);
    par257_270_in = zeros(length(E),12);
    for i = 1 : length(par257_270(1,:))/2
        A = par257_270(:,2*i-1);
        j = 1;
        l = length(par257_270(par257_270(:,2*i-1)~=0));
        while j <= l
            b = find(A == par257_270(j,2*i-1));
            if length(b) > 1
                ind = max(b);
                add = linspace(0,par257_270(ind+1,2*i-1)-par257_270(ind,2*i-1),ind-j+2);
                par257_270(j:ind,2*i-1) = par257_270(j:ind,2*i-1) + add(1:ind-j+1)' ;
                j = j + length(b) ;
            else
                j = j + 1;
            end
        end
        %plot(par257_270(:,2*i-1),par257_270(:,2*i));
        par257_270_in(:,i) = interp1(par257_270(1:l,2*i-1),par257_270(1:l,2*i),E,'linear',0);
        plot(E,par257_270_in(:,i));
    end

 %% Alternate code (working)
%     for i = 1 : 12
%         A = par257_270(:,2*i-1);
%         j = 1;
%         while j <= length(par257_270(par257_270(:,2*i-1)~=0))
%             b = find(A == par257_270(j,2*i-1));
%             if length(b) > 1
%                 ind = max(b);
%                 add = linspace(0,par257_270(ind+1,2*i-1)-par257_270(ind,2*i-1),length(b)+1);
%                 par257_270(j:ind,2*i-1) = par257_270(j:ind,2*i-1) + add(1:length(b))' ;
%                 j = j + length(b);
%             else
%                 j = j + 1;
%             end
%         end
%     end