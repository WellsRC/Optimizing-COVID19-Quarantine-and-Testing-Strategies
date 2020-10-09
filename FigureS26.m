%infectivity profile plots
clear;
close all;
clc;
figure('units','normalized','outerposition',[0.2 0 0.5 0.5]);

subplot('Position',[0.09 0.18 0.88 0.8]);


ts1=5.2;
t=linspace(0,ts1+30,1001);
R0=2.5;
S1=R0.*ViralShedding_Symptomatic(t,ts1);
p1=plot(t-ts1,S1,'color',hex2rgb('#2c7fb8'),'LineWidth',2); hold on


ts1=7.76;
t=linspace(0,ts1+30,1001);
R0=2.5;
S1=R0.*ViralShedding_Symptomatic(t,ts1);
p2=plot(t-ts1,S1,'color',hex2rgb('#2A3132'),'LineWidth',2); hold on

ts1=8.29;
t=linspace(0,ts1+30,1001);
R0=2.5;
S1=R0.*ViralShedding_Symptomatic(t,ts1);
p3=plot(t-ts1,S1,'color',hex2rgb('#7fcdbb'),'LineWidth',2); hold on

ts1=14;
t=linspace(0,ts1+30,1001);
R0=2.5;
S1=R0.*ViralShedding_Symptomatic(t,ts1);
p4=plot(t-ts1,S1,'color',hex2rgb('#edf8b1'),'LineWidth',2); hold on

plot(zeros(101,1),linspace(0,1,101),'-.','color',[0.7 0.7 0.7],'LineWidth',1.5)
box off;
xlabel('Day of symptom onset','Fontsize',18);
ylabel('Infectivity','Fontsize',18);

legend([p1 p2 p3 p4],{'5.2 days','7.76 days','8.29 days','14 days'},'Fontsize',14);
legend boxoff;
ylim([0 0.4]);
xlim([-14 30]);
set(gca,'LineWidth',2,'tickdir','out','Fontsize',16,'XTick',[-14:2:30],'XMinorTick','on','Yminortick','on','YTick',[0:0.1:1]);


print(gcf,'FigureS26','-dpng','-r600');