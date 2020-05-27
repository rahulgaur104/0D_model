 function dy = rigid(t,y)
    % should be called from within main_solve.m
    % testing stiff ODE solver -- ode15s
    dy = zeros(4,1);    % a column vector
    a = [1 1 1];
    nH = y(2);
    dy(1) = nH * y(3);
    dy(2) = -y(1) * y(3);
    dy(3) = -nH*sum(y(1:3));
    dy(4) = dy(1) + dy(2) + dy(3); 
%   dy(3) = -0.51 * y(1)*y(3);s
