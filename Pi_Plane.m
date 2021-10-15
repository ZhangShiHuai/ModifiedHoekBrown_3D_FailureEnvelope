%% plot the variation of the deviatoric plane along the hydrostatic axis

for int=10:10:60
    
hold on
  I1_draw1=I1_draw(int);
    theta_draw_dev=linspace(0,2*pi,10000);
    rho=sqrt(2)*sqrtJ2max(int)*sin(alpha(int)*pi/3-asin(A(int))/3)./sin(alpha(int)*pi/3+asin(A(int)*sin(3*theta_draw_dev))/3);  
    z=sqrt(2/3).*rho.*sin(theta_draw_dev+pi*2/3)+I1_draw1/3;%sigma1
    x=sqrt(2/3).*rho.*sin(theta_draw_dev)+I1_draw1/3;%sigma2
    y=sqrt(2/3).*rho.*sin(theta_draw_dev-pi*2/3)+I1_draw1/3;%sigma3
    plot3(x,y,z,'k','linewidth',1)
end

axis equal
view(45,30)
legend([h1,h2],'Conventional triaxial test','True triaxial test','location','northwest')
%% PI plane projection
figure
polar(pi/2*ones(500,1),(1:1:500)','k-')
hold on
polar(5*pi/6*ones(500,1),(1:1:500)','k--')
hold on
polar(7*pi/6*ones(500,1),(1:1:500)','k-')
hold on
polar(3*pi/2*ones(500,1),(1:1:500)','k--')
hold on
polar(11*pi/6*ones(500,1),(1:1:500)','k-')
hold on
polar(pi/6*ones(500,1),(1:1:500)','k--')


%
hold on
for int=10:10:60
    theta_draw_dev=linspace(0,2*pi,10000);
    rho=sqrt(2)*sqrtJ2max(int)*sin(alpha(int)*pi/3-asin(A(int))/3)./sin(alpha(int)*pi/3+asin(A(int)*sin(3*theta_draw_dev))/3);  
    H=polar(theta_draw_dev,rho,'k');
    set(H, 'LineWidth', 1);
    hold on
end
hold on
polar((theta(1:21)+120*pi/180),sqrtJ2(1:21)*sqrt(2),'ro')
hold on
polar((theta(22:41)+120*pi/180),sqrtJ2(22:41)*sqrt(2),'bo')


text(-200,420,0,'\it\theta_{\it\sigma}\rm=-30\circ','HorizontalAlignment','left','FontSize',12,'Fontname', 'Times New Roman')
text(-400,260,0,'\it\theta_{\it\sigma}\rm=30\circ','HorizontalAlignment','left','FontSize',12,'Fontname', 'Times New Roman')
text(20,-350,0,'\itI_{\rm1}\rm=1000MPa','HorizontalAlignment','left','FontSize',12,'Fontname', 'Times New Roman')

text(470,-200,0,'$\sigma _{3}^{\prime } $','Interpreter','latex','HorizontalAlignment','left','FontSize',15)
text(-530,-200,0,'$\sigma _{2}^{\prime } $','Interpreter','latex','HorizontalAlignment','left','FontSize',15)
text(-100,530,0,'$\sigma _{1}^{\prime } $','Interpreter','latex','HorizontalAlignment','left','FontSize',15)