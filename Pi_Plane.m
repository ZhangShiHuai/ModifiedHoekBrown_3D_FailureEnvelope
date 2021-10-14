%% plot the variation of the deviatoric plane along the hydrostatic axis

for int=10:10:60
    
hold on
  I1_draw1=I1_draw(int);
    theta_draw_dev=linspace(0,2*pi,10000);
    rho=sqrt(2)*sqrtJ2max(int)*sin(alpha(int)*pi/3-asin(A(int))/3)./sin(alpha(int)*pi/3+asin(A(int)*sin(3*theta_draw_dev))/3);  
    z=sqrt(2/3).*rho.*sin(theta_draw_dev+pi*2/3)+I1_draw1/3;%sigma1
    x=sqrt(2/3).*rho.*sin(theta_draw_dev)+I1_draw1/3;%sigma2
    y=sqrt(2/3).*rho.*sin(theta_draw_dev-pi*2/3)+I1_draw1/3;%sigma3
    plot3(x,y,z,'r','linewidth',2)
end   
%h=allchild(gca); 
%rotate(h,[0 0 1],-80);
view(45,30)
axis equal
%% PI plane projection
figure
polar(pi/2*ones(500,1),(1:1:500)','-')
hold on
polar(5*pi/6*ones(500,1),(1:1:500)','--')
hold on
polar(7*pi/6*ones(500,1),(1:1:500)','-')
hold on
polar(3*pi/2*ones(500,1),(1:1:500)','--')
hold on
polar(11*pi/6*ones(500,1),(1:1:500)','-')
hold on
polar(pi/6*ones(500,1),(1:1:500)','--')
hold on
for int=10:10:60
    theta_draw_dev=linspace(0,2*pi,10000);
    rho=sqrt(2)*sqrtJ2max(int)*sin(alpha(int)*pi/3-asin(A(int))/3)./sin(alpha(int)*pi/3+asin(A(int)*sin(3*theta_draw_dev))/3);  
    H=polar(theta_draw_dev,rho,'k');
    set(H, 'LineWidth', 2);
    hold on
end
hold on
polar((theta(1:21)+120*pi/180),sqrtJ2(1:21)*sqrt(2),'ro')
hold on
polar((theta(22:41)+120*pi/180),sqrtJ2(22:41)*sqrt(2),'bo')
