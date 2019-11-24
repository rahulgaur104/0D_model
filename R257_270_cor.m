function [k] = R257_270_cor(Te)
        load('sigma_in_257_270.mat'); % created using the m file R257_270_cor_sigma. Do
        m_e = 9.1e-31;                % not change the m or range of E without changing                                    
        m = 1000;                     % it in that file.
        E = logspace(-2.5,0.8,m);
%         m = 1000;
%         E = logspace(-2.5,0.8,m);
%         l = length(R257_270(:,1));    
%         sigma_in_temp = zeros(l,m); 
%         sigma_in_perm = zeros(14,m);
%         k = zeros(1,14);
%         j = 1;
%         counter = 0;
%    for i=1:l
%             Ex = R257_270(i,2:3);
%             sigmay = [0,R257_270(i,4)];
%             sigma_in_temp(i,:) = interp1(Ex,sigmay,E','linear',0);
% %             custfit = fittype('a*exp(-x^2)','dependent',{'y'},...
% %                           'independent',{'x'},'coefficients',{'a'});
% %             [z] = fit(Ex(2),sigmay(2),custfit); 
%             a = sigmay(2)/exp(-Ex(2)^2);
%             n = sigma_in_temp(i,:);
%             ind = (m-(find(fliplr(n),1)+1));
% %             ind = length(n(n > 0));
%             sigma_in_temp(i,ind+1:m) = a*exp(-E(ind+1:m).^2);
%         if i > 1
%             if i > 1 && R257_270(i) == R257_270(i-1) && R257_270(i) ~= R257_270(i+1)
%                 sigma_in_perm(j,:) = sigma_in_perm(j,:) + sigma_in_temp(i,:);
%                 sigma_in_perm(j,:) = sigma_in_perm(j,:)/(counter+1);
%                 counter = 0;
%                 j = j+1;
%             elseif i > 1 && R257_270(i) == R257_270(i+1)
%                 sigma_in_perm(j,:) = sigma_in_perm(j,:) + sigma_in_temp(i,:);
%                 counter = counter+1;
%             else
%                 sigma_in_perm(j,:) = sigma_in_perm(j,:) + sigma_in_temp(i,:);
%                 counter = 0;
%                 j = j + 1;
%             end
%         else
%                 sigma_in_perm(j,:) = sigma_in_perm(j,:) + sigma_in_temp(i,:);
%                 counter = counter + 1; 
%         end
%    end
%    sigma_in_perm = sigma_in_perm*1e-20;
        for i = 1:14
            k(i) = 4e-10*sqrt(8/(pi*m_e))/Te^(3/2)*trapz(E,sigma_in_perm(i,:).*E.*exp(-E./Te));  
        end
        
        
        
        