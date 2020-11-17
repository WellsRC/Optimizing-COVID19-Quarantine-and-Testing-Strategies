% Plots the infecitvy profile for the two incubation periods
clear;
close all;
clc;



figure('units','normalized','outerposition',[0.2 0.2 0.5 0.5]);

load('ImpactSelfIsolation_R0=2_5.mat');

tt=[linspace(-8.29,0,301) linspace(0,39,5001)]+8.29;

    IDO=pchip(t,ID(tLv==2.9,:),tt);
    IDA=pchip(t,ID(tLv==1.9,:),tt);
    IDA2=pchip(t,ID(tLv==3.9,:),tt);
    RS1=RS(tLv==2.9);
    RSA=RS(tLv==1.9);
    RSA2=RS(tLv==3.9);
subplot('Position',[0.09 0.17 0.88 0.8]);
t2=linspace(-21,0,1001);
% patch([t2 flip(t2)],[pchip(tt,ID,t2) zeros(size(t2))],[0.7 0.7 0.7],'LineStyle','none','Facealpha',0.3); hold on
p3=plot(tt,IDA2,'-.','color',hex2rgb('#4CB5F5'),'LineWidth',2); hold on
p2=plot(tt,IDA,'-.','color',hex2rgb('#66A5AD'),'LineWidth',2); hold on
p1=plot(tt,IDO,'color',hex2rgb('#2A3132'),'LineWidth',2); hold on
text(-0.959999999999997+8.29,0.193258426966292, num2str(round(RPre(tLv==2.9),2),'%3.2f'),'color',hex2rgb('#2A3132'),'Fontsize',16,'HorizontalAlignment','center');
text(-0.959999999999997+8.29,0.143258426966292, num2str(round(RPre(tLv==1.9),2),'%3.2f'),'color',hex2rgb('#66A5AD'),'Fontsize',16,'HorizontalAlignment','center');
text(-0.959999999999997+8.29,0.093258426966292, num2str(round(RPre(tLv==3.9),2),'%3.2f'),'color',hex2rgb('#4CB5F5'),'Fontsize',16,'HorizontalAlignment','center');
plot(ts.*ones(101,1),linspace(0,0.45,101),'-.','color',[0.7 0.7 0.7],'LineWidth',1.5)
% bar([1:14],ID,'LineStyle','none');
legend([p1 p2 p3],{'2.9 day latent period','1.9 day latent period','3.9 day latent period'},'Fontsize',14);
legend boxoff;
box off;
xlabel('Day of post-infection','Fontsize',18);
ylabel('Infectivity','Fontsize',18);

ylim([0 0.45]);
xlim([0 21]);
set(gca,'LineWidth',2,'tickdir','out','Fontsize',16,'XTick',[-21:21],'XMinorTick','on','Yminortick','on','YTick',[0:0.1:0.9]);

fprintf('Expected number of infections under no self-isolation: %3.2f \n',RNS);
fprintf('Expected number of infections under self-isolation and %3.1f%% asymptomatic: %3.2f \n',[pA*100 RS(tLv==2.9)]);
fprintf('Expected number of infections under self-isolation and %3.1f%% asymptomatic: %3.2f \n',[pA*100 RS(tLv==1.9)]);
fprintf('Expected number of infections under self-isolation and %3.1f%% asymptomatic: %3.2f \n',[pA*100 RS(tLv==3.9)]);


print(gcf,'FigureS11','-dpng','-r600');
