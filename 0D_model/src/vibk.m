function [K] = vibk(k,vi,vf)
    K = zeros(1,14);
    if vi == 0
        for vi = 1:14
            K(vi) = k(14*(vi-1) + vf);
        end
    else
        for vf = 1:14
            K(vf) = k(14*(vi-1) + vf);
        end
    end