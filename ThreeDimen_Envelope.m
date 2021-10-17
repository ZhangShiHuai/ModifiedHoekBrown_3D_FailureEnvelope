I1_draw=linspace(-3*ucs/mi_best,1000,60);
% Initiation
m=60;
X=[];Y=[];Z =zeros(60,m);% 60 equals to I1_draw=linspace(-3*beta,1000,    60       );
% Calculate strength parameters
sqrtJ2max=(-mi_best*ucs+sqrt((mi_best*ucs)^2+12*mi_best*ucs*I1_draw+36*ucs^2))/(6*sqrt(3));
sqrtJ2min=(-mi_best*ucs+sqrt((mi_best*ucs)^2+3*mi_best*ucs*I1_draw+9*ucs^2))/(3*sqrt(3));
Chi=(mi_best*ucs)./(sqrt(3)*sqrt((mi_best*ucs)^2+12*mi_best*ucs*I1_draw+36*ucs^2));
fai=asin(9*Chi./(3*Chi+2*sqrt(3)));
etaMN=(9-(sin(fai)).^2)./(1-(sin(fai)).^2);
A=sqrt((etaMN.^3-9*etaMN.^2)./((etaMN-3).^3));
A(1)=1;
K=sqrtJ2min./sqrtJ2max;
alpha=(3/pi)*atan((1+K).*tan(asin(A)/3)./(1-K));
alpha(1)=1;
%
for i=1:length(I1_draw)
    theta_draw_dev=linspace(0,2*pi,m);
    rho=sqrt(2)*sqrtJ2max(i)*sin(alpha(i)*pi/3-asin(A(i))/3)./sin(alpha(i)*pi/3+asin(A(i)*sin(3*theta_draw_dev))/3);  
    z=sqrt(2/3).*rho.*sin(theta_draw_dev+pi*2/3)+I1_draw(i)/3;%sigma1
    x=sqrt(2/3).*rho.*sin(theta_draw_dev)+I1_draw(i)/3;%sigma2
    y=sqrt(2/3).*rho.*sin(theta_draw_dev-pi*2/3)+I1_draw(i)/3;%sigma3
    X(i,:)=x;
    Y(i,:)=y;
    Z(i,:)=z;

 end
%% Plot figure
figure
mesh(X,Y,Z,'edgecolor',[0.8 0.8 0.8]);
axis equal;
grid off;axis on;
hold on
%
h1 = plot3(sigma2(1:21),sigma3(1:21),sigma1(1:21),'.r','linewidth',3,'MarkerSize',10);
hold on
h2 = plot3(sigma2(22:41),sigma3(22:41),sigma1(22:41),'.b','linewidth',3,'MarkerSize',10);
hold on
plot3([0,450],[0,450],[0,450],'k-','linewidth',1)

% fugure setting
xlabel({'\sigma_{2} (MPa)'},'rotation',-30)%,'Position',[100 -200 00]);
ylabel({'\sigma_{3} (MPa)'},'rotation',30)%,'Position',[-500/4 100 0]);
zlabel('\sigma_{1} (MPa)')
set(gca,'xtick',(0:200:700),'xlim',[-20,700],'ytick',(0:200:700),'ylim',[-20,700],'ztick',(0:200:700),'zlim',[-20,700])
text(400,400,500,'Hydrostatic axis','HorizontalAlignment','left','FontSize',12,'Fontname', 'Times New Roman')
set(gca,'FontSize',12,'Fontname', 'Times New Roman')
set(gcf,'unit','centimeters','position',[15 10 13 10])
box on
view(45,30)
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
legend([h1,h2],'Conventional triaxial test','True triaxial test','location','northeast')