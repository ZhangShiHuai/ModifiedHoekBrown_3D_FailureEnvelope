%% PI plane projection
figure
polarplot(pi/2*ones(500,1),(1:1:500)','k-')
hold on
polarplot(5*pi/6*ones(500,1),(1:1:500)','k--')
hold on
polarplot(7*pi/6*ones(500,1),(1:1:500)','k-')
hold on
polarplot(3*pi/2*ones(500,1),(1:1:500)','k--')
hold on
polarplot(11*pi/6*ones(500,1),(1:1:500)','k-')
hold on
polarplot(pi/6*ones(500,1),(1:1:500)','k--')


%
hold on
for int=10:10:60
    theta_draw_dev=linspace(0,2*pi,10000);
    rho=sqrt(2)*sqrtJ2max(int)*sin(alpha(int)*pi/3-asin(A(int))/3)./sin(alpha(int)*pi/3+asin(A(int)*sin(3*theta_draw_dev))/3);  
    H=polarplot(theta_draw_dev,rho,'k');
    set(H, 'LineWidth', 1);
    hold on
end
hold on
h1=polarplot((theta(1:21)+120*pi/180),sqrtJ2(1:21)*sqrt(2),'ro');
hold on
h2=polarplot((theta(22:41)+120*pi/180),sqrtJ2(22:41)*sqrt(2),'bo');

text(pi/2,450,'\it\theta_{\it\sigma}\rm=-30\circ','HorizontalAlignment','left','FontSize',12,'Fontname', 'Times New Roman')
text(4.9*pi/6,450,'\it\theta_{\it\sigma}\rm=30\circ','HorizontalAlignment','left','FontSize',12,'Fontname', 'Times New Roman')
text(3*pi/2,350,'\itI_{\rm1}\rm=1000MPa','HorizontalAlignment','left','FontSize',12,'Fontname', 'Times New Roman')

text(-pi/6,530,'$\sigma _{3}^{\prime } $','Interpreter','latex','HorizontalAlignment','left','FontSize',15)
text(7*pi/6,580,'$\sigma _{2}^{\prime } $','Interpreter','latex','HorizontalAlignment','left','FontSize',15)
text(pi/2,530,'$\sigma _{1}^{\prime } $','Interpreter','latex','HorizontalAlignment','left','FontSize',15)

thetaticks([])
rticklabels([])
pax = gca;
pax.RGrid='off';

legend([h1,h2],'Conventional triaxial test','True triaxial test','location','northeast')