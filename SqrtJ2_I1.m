%% Plot sqrtJ2-I1 relationship
figure
plot(I1(1:21),sqrtJ2(1:21),'r<')
hold on
plot(I1(22:41),sqrtJ2(22:41),'b<')
hold on
sqrtJ2max_draw=(-mi_best*ucs+sqrt((mi_best*ucs)^2+12*mi_best*ucs*I1_draw+36*ucs^2))/(6*sqrt(3));
sqrtJ2min_draw=(-mi_best*ucs+sqrt((mi_best*ucs)^2+3*mi_best*ucs*I1_draw+9*ucs^2))/(3*sqrt(3));
plot(I1_draw,sqrtJ2max_draw)
hold on
plot(I1_draw,sqrtJ2min_draw)
hold on
plot([0,0],[0,250])
%% Quantify prediction error
sqrtJ2max_pre=(-mi_best*ucs+sqrt((mi_best*ucs)^2+12*mi_best*ucs*I1+36*ucs^2))/(6*sqrt(3)); % '_pre' denotes prediction.
sqrtJ2min_pre=(-mi_best*ucs+sqrt((mi_best*ucs)^2+3*mi_best*ucs*I1+9*ucs^2))/(3*sqrt(3));
Chi_pre=(mi_best*ucs)./(sqrt(3)*sqrt((mi_best*ucs)^2+12*mi_best*ucs*I1+36*ucs^2));
fai_pre=asin(9*Chi_pre./(3*Chi_pre+2*sqrt(3)));
etaMN_pre=(9-(sin(fai_pre)).^2)./(1-(sin(fai_pre)).^2);
A_pre=sqrt((etaMN_pre.^3-9*etaMN_pre.^2)./((etaMN_pre-3).^3));
A_pre=real(A_pre);
K_pre=sqrtJ2min_pre./sqrtJ2max_pre;
alpha_pre=(3/pi)*atan((1+K_pre).*tan(asin(A_pre)/3)./(1-K_pre));
[~,xh]=size(alpha_pre');
for nn=1:xh
    if alpha_pre(nn)<1
        alpha_pre(nn)=1;
    end
end
sqrtJ2_pre=zeros(41);
for i=1:41
sqrtJ2_pre(i,1)=sqrtJ2max_pre(i)*sin(alpha_pre(i)*pi/3-asin(A_pre(i))/3)./sin(alpha_pre(i)*pi/3+asin(A_pre(i)*sin(3*theta(i)))/3);    
end
%
relative_error=[];
for ii=1:41
    ER=abs(sqrtJ2(ii)-sqrtJ2_pre(ii))/sqrtJ2(ii);
    relative_error=[relative_error;ER];
end
relative_error=relative_error.*100;
  
