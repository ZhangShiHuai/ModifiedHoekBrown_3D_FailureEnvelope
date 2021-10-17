% Fit strengh parameters according to experimental data
%% Import peak strength data of Zigong sandstone, including data from conventional compression tests and true triaxial tests.
clc;clear;
filename='peak_strength.txt';
delimiterIn=' ';
headerlinesIn=1;
peak=importdata(filename,delimiterIn,headerlinesIn);
%
% triaxial:1~21     true triaxial: 22~41
sigma1=peak.data(:,1);
sigma2=peak.data(:,2);
sigma3=peak.data(:,3);
I1=sigma1+sigma2+sigma3;
theta=atan((2*sigma2-sigma1-sigma3)./(sqrt(3)*(sigma1-sigma3)));
sqrtJ2=sqrt(((sigma1-sigma2).^2+(sigma1-sigma3).^2+(sigma2-sigma3).^2)/6);
tao_oct=sqrt(((sigma1-sigma2).^2+(sigma1-sigma3).^2+(sigma2-sigma3).^2))/3;
sigma_m2=(sigma1+sigma3)/2;
%% Fitting
% slove mi
data=tao_oct;
ydata=sigma_m2;
a0=[15 100];
options=optimset('MaxFunEvals',10000);
[a,resnorm]=lsqcurvefit('Solve_mi',a0,data,ydata);
%% Plot
figure
plot(sigma_m2(1:21),tao_oct(1:21),'ro','markersize',8)
hold on
plot(sigma_m2(22:41),tao_oct(22:41),'bo','markersize',8)
hold on
% 
mi_best=a(1);
ucs=a(2);
tao_oct_draw=linspace(0,200,10000);
sigma_m2_draw=9*tao_oct_draw.^2/(mi_best*2*ucs)+3*tao_oct_draw/(2*sqrt(2))-ucs/mi_best;
plot(sigma_m2_draw,tao_oct_draw,'k','linewidth',1)

% figure setting
xlabel('\sigma_{m,2} (MPa)')
ylabel('\tau_{\itoct} (MPa)')
set(gca,'xtick',(-50:50:350),'xlim',[-50,350],'ytick',(0:20:200),'ylim',[0,200])
textstr={'\itm_{i}\rm=16.76'; '\sigma_{\itc}\rm=90.85MPa' ; '\itR\rm^{2}=0.9931'};
text(200,60,textstr,'HorizontalAlignment','left','FontSize',12,'Fontname', 'Times New Roman')
legend('Conventional triaxial test','True triaxial test','Best fitting curve','location','northwest')
legend boxoff
set(gca,'FontSize',12,'Fontname', 'Times New Roman')
set(gcf,'unit','centimeters','position',[15 10 13 10])
%title('XXX')
