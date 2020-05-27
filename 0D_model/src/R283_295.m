function [k] = R283_295(Te)
    E = linspace(1,200,200);
    load('../lookup_files/R271-282.mat');
    Ev = par271_282(:,6);
    Ev0 = 30.6;
    k = zeros(1,length(Ev)); 
    m_e = 9.1e-31;
    e = 1.60217e-19;
    k_B = 1.38064e-23;
    for i = 1:length(Ev)
        x = E./Ev(i);
        C0 = 2.05*Ev(i);
        sigma = ((Ev0/Ev(i))^1.15)*1.828e-20./x.*(1-1./x.^0.92).^2.19.*log(C0.*x);   
        % for the intermediate +sig^2 u intermediate state
        sigma = [zeros(1,length(sigma(imag(sigma)~=0))) sigma(imag(sigma)==0)];
        % This functionality is only available in matlab. Through this I'm
        % filtering out any imaginary cross-section values.
        % eg : sigma(imag(sigma)==0) means choose only those sigma where
        % the imaginary part is 0 i.e. only real sigma.
        % sigma = sigma(imag(sigma)==0);
        k(i) = 4e-10*sqrt(8/(pi*m_e))/Te^(3/2)*trapz(E,sigma.*E.*exp(-E./Te));      
    end