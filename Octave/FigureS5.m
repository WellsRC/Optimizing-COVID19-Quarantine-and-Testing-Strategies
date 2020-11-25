%produces the plot for the probability of post-quarantine transmission for
%different values of pA
clear;
close all;
load('VaryPA_NoTesting_5day.mat')
Risk=1;
tL=2.9; % Baseline latent period
IDSNT5=Probability_Onward(IDSL(tLv==tL)',Risk);
load('VaryPA_NoTesting_7day.mat')
IDSNT7=Probability_Onward(IDSL(tLv==tL)',Risk);

load('VaryPA_TestingonEntryExit_5day_OneDayDelay.mat')
IDSTEX5=Probability_Onward(IDSL(tLv==tL)',Risk);

load('VaryPA_TestingonEntryExit_7day_96hrs.mat')
IDSTEX7=Probability_Onward(IDSL(tLv==tL)',Risk);

figure('units','normalized','outerposition',[0 0 0.5 1]);
subplot('Position',[0.15,0.602558087350318,0.835,0.379328859060402]);
b=bar(pA,[IDSNT5' IDSTEX5'],'linestyle','none');
b(1).FaceColor=hex2rgb('#F25C00');
b(2).FaceColor=hex2rgb('#1995AD');
xlabel('Proportion of infections that are asymptomatic','Fontsize',20);
ylabel({'Probability of post-quarantine','transmission'},'Fontsize',20);

ylim([0 0.20]);
set(gca,'LineWidth',2,'tickdir','out','Fontsize',18,'Xminortick','on','YTick',[0:0.05:0.40],'Yminortick','on');
box off;
legend({'No Testing','Testing on entry and exit'},'Location','NorthWest');
legend boxoff;
text(-0.21,0.4019/2,'A','Fontsize',32,'FontWeight','bold');

subplot('Position',[0.15,0.12,0.835,0.379328859060402]);
b=bar(pA,[IDSNT7' IDSTEX7'],'linestyle','none');

b(1).FaceColor=hex2rgb('#F25C00');
b(2).FaceColor=hex2rgb('#1995AD');
xlabel('Proportion of infections that are asymptomatic','Fontsize',20);
ylabel({'Probability of post-quarantine','transmission'},'Fontsize',20);
ylim([0 0.20]);
set(gca,'LineWidth',2,'tickdir','out','Fontsize',18,'Xminortick','on','YTick',[0:0.05:0.40],'Yminortick','on');
box off;
text(-0.21,0.4019/2,'B','Fontsize',32,'FontWeight','bold');

print(gcf,'FigureS5','-dpng','-r600');
