function [k] = R296_309(Te)
% %     load('R296_309.mat');
% %     f_in = zeros(length(v),length(f(1,:))/2);
% %     for i = 1:length(f(1,:))/2
% %         l = length(f(f(:,2*i-1)>0));
% %         f_in(:,i) = interp1(f(1:l,2*i-1),f(1:l,2*i),v,'linear','extrap');
% %     end

 
% %     v = linspace(1,14,14); 
% %     custfit = fittype('a*exp(b*x) + c*exp(d*x)',...
% %                 'dependent',{'y'},'independent',{'x'},...
% %                 'coefficients',{'a','b','c','d'});
% %     for i = 1:length(par296_309(1,:))
% %         [z,gof] = fit(v(1:10)',par296_309(2:11,i),custfit);
% %         par296_309(12:15,i) = z.a*exp(z.b.*v(11:14)) + z.c*exp(z.d.*v(11:14));
% %     end

% %     v = linspace(1,14,14);
% %     custfit = fittype('a*x^b+c','dependent',{'y'},...
% %                 'independent',{'x'},'coefficients',{'a','b','c'});
% %     for i = 1:length(par296_309(2,:))
% %         [z,gof] = fit(v(1:10)',par296_309(2:11,i),custfit);
% %         par296_309(12:15,i) = z.a*exp(z.b.*v(11:14)) + z.c*exp(z.d.*v(11:14));
% %     end
        
        m_e = 9.1e-31;
        mH = 1.67e-27;
        e = 1.60217e-19;
        k_B = 1.38064e-23;
        load('R296_309_1.mat');
        
%         E = par296_309(1,:);
%         E_in = linspace()
          En = 0.25;
%     for i = 1:14
%         sigma = 17.76e-20./(E.^0.477.*(1 + 0.0291*E.^3.61 + 1.53e-5*E.^6.55)).*par296_309(i+1,:);  
%         k(i) = 4e-10*sqrt(8/(pi*m_e))/Te^(3/2)*trapz(E,sigma.*E.*exp(-E./Te));
        sigma = 17.76e-20/(En^0.477*(1 + 0.0291*En^3.61 + 1.53e-5*En^6.55)).*par296_309(2:15,2);  
%     end
        k = sqrt(16*e*Te/(pi*mH))*sigma;