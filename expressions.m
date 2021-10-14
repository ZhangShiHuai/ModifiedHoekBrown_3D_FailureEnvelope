function y=expressions(sigma1,sigma2,sigma3,mi,ucs)
y=sqrtJ2(sigma1,sigma2,sigma3)-((-mi*ucs+sqrt((mi*ucs)^2+12*mi*ucs*I1(sigma1,sigma2,sigma3)+36*ucs^2))/(6*sqrt(3)))*sin(alpha(sigma1,sigma2,sigma3,mi,ucs)*pi/3-asin(A(sigma1,sigma2,sigma3,mi,ucs))/3)/sin(alpha(sigma1,sigma2,sigma3,mi,ucs)*pi/3+asin(A(sigma1,sigma2,sigma3,mi,ucs)*sin3theta(sigma1,sigma2,sigma3))/3);
end

function y1=sqrtJ2(sigma1,sigma2,sigma3)
y1=sqrt(((sigma1-sigma2)^2+(sigma2-sigma3)^2+(sigma1-sigma3)^2)/6);
end

function y2=sqrtJ2max(sigma1,sigma2,sigma3,mi,ucs)
y2=(-mi*ucs+sqrt((mi*ucs)^2+12*mi*ucs*I1(sigma1,sigma2,sigma3)+36*ucs^2))/(6*sqrt(3));
end

 function y3=I1(sigma1,sigma2,sigma3)
 y3=sigma1+sigma2+sigma3;
 end

 function y4=J3(sigma1,sigma2,sigma3)
 y4=(2*sigma1-sigma2-sigma3)*(2*sigma2-sigma1-sigma3)*(2*sigma3-sigma1-sigma2)/27;
 end

 function y5=sin3theta(sigma1,sigma2,sigma3)
  y5=(-3*sqrt(3)/2)*J3(sigma1,sigma2,sigma3)/(sqrtJ2(sigma1,sigma2,sigma3)^3);
 end  

 function y6=sqrtJ2min(sigma1,sigma2,sigma3,mi,ucs)
 y6=(-mi*ucs+sqrt((mi*ucs)^2+3*mi*ucs*I1(sigma1,sigma2,sigma3)+9*ucs^2))/(3*sqrt(3));
 end

function y7=K(sigma1,sigma2,sigma3,mi,ucs)
 y7=sqrtJ2min(sigma1,sigma2,sigma3,mi,ucs)/sqrtJ2max(sigma1,sigma2,sigma3,mi,ucs);
end

function y8=Chi(sigma1,sigma2,sigma3,mi,ucs)
y8=(mi*ucs)/(sqrt(3)*sqrt((mi*ucs)^2+12*mi*ucs*I1(sigma1,sigma2,sigma3)+36*ucs^2));
end

function y9=fai(sigma1,sigma2,sigma3,mi,ucs)
y9=asin(9*Chi(sigma1,sigma2,sigma3,mi,ucs)/(3*Chi(sigma1,sigma2,sigma3,mi,ucs)+2*sqrt(3)));
end

function y10=etaMN(sigma1,sigma2,sigma3,mi,ucs)
y10=(9-(sin(fai(sigma1,sigma2,sigma3,mi,ucs)))^2)/(1-(sin(fai(sigma1,sigma2,sigma3,mi,ucs)))^2);
end

function y11=A(sigma1,sigma2,sigma3,mi,ucs)
y11=sqrt((etaMN(sigma1,sigma2,sigma3,mi,ucs)^3-9*etaMN(sigma1,sigma2,sigma3,mi,ucs)^2)/((etaMN(sigma1,sigma2,sigma3,mi,ucs)-3)^3));
if y11>1
    y11=1;
end
end

function y12=alpha(sigma1,sigma2,sigma3,mi,ucs)
y12=real((3/pi)*atan((1+K(sigma1,sigma2,sigma3,mi,ucs))*tan(asin(A(sigma1,sigma2,sigma3,mi,ucs))/3)/(1-K(sigma1,sigma2,sigma3,mi,ucs))));
end














