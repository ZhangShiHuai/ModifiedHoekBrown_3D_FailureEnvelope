%% Plot the intermediate principal stress effect
sigma3_temp=[0;20;65;];
[mm,~]=size(sigma3_temp);
figure
for i=1:mm
    for sigma2_temp=sigma3_temp(i):0.5:924
        [sigma1_temp] = solve_sigma1( 50,600,sigma2_temp,sigma3_temp(i) ,mi_best,ucs,1e-6);
         if sigma2_temp>sigma1_temp
            break
         end
        
        h1 = plot(sigma2_temp,sigma1_temp,'.-b','MarkerSize',1);
        hold on
    end
    
end
hold on
plot([0,500],[0,500],'k')
% true triaxial data
plot(sigma2(22:41),sigma1(22:41),'bo')
hold on 
% conventional triaxial data
plot(sigma2(1:21),sigma1(1:21),'ro')
hold on
sigma3_draw = linspace(0,80,1000)';
sigma1_draw = sigma3_draw + sqrt(mi_best*ucs*sigma3_draw+ucs^2);
h2 = plot(sigma3_draw,sigma1_draw,'r-');

%
h3 = plot(sigma2(1:21),sigma1(1:21),'ro');
hold on
h4 = plot(sigma2(22:41),sigma1(22:41),'bo');
hold on           

% fugure setting
xlabel('\sigma_{2} (MPa)')
ylabel('\sigma_{1} (MPa)')
set(gca,'xtick',(0:100:500),'xlim',[0,500],'ytick',(0:100:500),'ylim',[0,500])
legend([h3,h4,h2,h1],'Conventional triaxial test','True triaxial test','Best-fit envelope','Best-fit envelope','location','southeast')
legend boxoff
text(100,80,'\sigma_{3}=0MPa','HorizontalAlignment','left','FontSize',12,'Fontname', 'Times New Roman')
text(240,200,'20MPa','HorizontalAlignment','left','FontSize',12,'Fontname', 'Times New Roman')
text(300,400,'60MPa','HorizontalAlignment','left','FontSize',12,'Fontname', 'Times New Roman')
set(gca,'FontSize',12,'Fontname', 'Times New Roman')
set(gcf,'unit','centimeters','position',[15 10 13 10])