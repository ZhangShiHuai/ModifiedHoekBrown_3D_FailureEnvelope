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
        
        plot(sigma2_temp,sigma1_temp,'.g','MarkerSize',1)
        hold on
    end
    
end
hold on
plot([0,500],[0,500])
%
plot(sigma2(1:21),sigma1(1:21),'ro')
hold on
plot(sigma2(22:41),sigma1(22:41),'bo')
hold on           
           
           
           
