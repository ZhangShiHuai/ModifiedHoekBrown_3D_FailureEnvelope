function [sigma1] = solve_sigma1( a,b,sigma2,sigma3 ,mi,ucs,err)
for k = 1:10000000
    sigma1 = (a + b )/2;
    fp = expressions(sigma1,sigma2,sigma3,mi,ucs);
    fa = expressions(a,sigma2,sigma3,mi,ucs);
        if (fp==0 ||(b - a)/2 < err)
        break
    end
        if(fa * fp < 0)
        b=sigma1; 
        else a = sigma1; 
        end   
end

