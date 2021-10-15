function f = Solve_mi( a,xdata )
%SOLVE_MI
%   a(1)=mi, a(2)=UCS;
x=xdata; % tao_oct

f= 9*(x.^2)/(2*a(1)*a(2))+3*x/(2*sqrt(2))-a(2)/a(1);
end
