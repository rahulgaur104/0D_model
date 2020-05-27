function press_ver
     load('../lookup_files/data_sam.mat');
     l = 100;
     p = logspace(0.008,2,l);
     k_B = 1.39e-23;
     e = 1.6e-19;
     Tg = 2000;
     m = l-30;
     data_sam_in = zeros(8,l);
     T = zeros(12,m);
     Ti_f =@(p) (e/(2*k_B)-Tg)./p + Tg;
     Ti = Ti_f(p(1:m));
     for i = 1:13
        n = length(data_sam(data_sam(:,2*i-1) > 0)) ;
        data_sam_in(i,:) = interp1(data_sam(1:n,2*i-1),data_sam(1:n,2*i),p,'linear',0)';
     end
     T(1:2,:) = Tg;
     T(8:12,:) = Tg;
     T(3:6,:) = [Ti;Ti;Ti;Ti];
     T(7,:) = data_sam_in(1,1:m)*e/k_B;
     p_act = sum(data_sam_in(2:13,1:m).*T(1:12,:))*k_B;
     plot(p(1:m),p_act,'-o');
     
      
     
        