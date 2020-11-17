%diagnostic sensitivity plots
clear;
close all;
clc;
figure('units','normalized','outerposition',[0.2 0 0.5 1]);
ts=8.29;
tL=2.9;
t=linspace(0,ts+30,1001);
S1=SensitivityvsViralLoad(ViralShedding_Symptomatic(t,tL),ts,tL);
subplot('Position',[0.09 0.59 0.88 0.4]);
p1=plot(t,S1,'color',hex2rgb('#2A3132'),'LineWidth',2); hold on

x=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25];
y=[0.926573426573427,0.956293706293706,0.940559440559441,0.965034965034965,0.945804195804196,0.902097902097902,0.840909090909091,0.818181818181818,0.756993006993007,0.713286713286713,0.697552447552448,0.706293706293706,0.646853146853147,0.632867132867133,0.620629370629371,0.590909090909091,0.555944055944056,0.543706293706294,0.496503496503496,0.423076923076923,0.381118881118881,0.304195804195804,0.258741258741259,0.213286713286713,0.199300699300699,0.169580419580420];

p3=scatter(x+ts,y,20,'r','filled');
plot(zeros(101,1)+ts,linspace(0,1,101),'-.','color',[0.7 0.7 0.7],'LineWidth',1.5)
box off;
xlabel('Days post-infection','Fontsize',18);
ylabel('Diagnostic sensitivity','Fontsize',18);

legend([p1 p3],{'Sensitivity function',['Data']},'Fontsize',14);
legend boxoff;
ylim([0 1]);
xlim([ts-0.5 30]);
set(gca,'LineWidth',2,'tickdir','out','Fontsize',16,'XTick',[0:2:30],'XMinorTick','on','Yminortick','on','YTick',[0:0.1:1]);
text(5.76,0.969543147208122,'A','Fontsize',32,'FontWeight','bold');



subplot('Position',[0.09 0.09 0.88 0.4]);

ts=8.29;




tL=1.9;
S1=SensitivityvsViralLoad(ViralShedding_Symptomatic(t,tL),ts,tL);
p2=plot(t,S1,'color',hex2rgb('#66A5AD'),'LineWidth',2); hold on

tL=3.9;
S1=SensitivityvsViralLoad(ViralShedding_Symptomatic(t,tL),ts,tL);
p3=plot(t,S1,'color',hex2rgb('#4CB5F5'),'LineWidth',2); hold on

tL=2.9;

t=linspace(0,ts+30,1001);
S1=SensitivityvsViralLoad(ViralShedding_Symptomatic(t,tL),ts,tL);
p1=plot(t,S1,'color',hex2rgb('#2A3132'),'LineWidth',2); hold on

plot(zeros(101,1)+ts,linspace(0,1,101),'-.','color',[0.7 0.7 0.7],'LineWidth',1.5)
box off;
xlabel('Days post-infection','Fontsize',18);
ylabel('Diagnostic sensitivity','Fontsize',18);


legend([p1 p2 p3],{'Latent period 2.9 days','Latent period 1.9 days','Latent period 3.9 days'},'Fontsize',14);
legend boxoff;
ylim([0 1]);
xlim([0 30]);
set(gca,'LineWidth',2,'tickdir','out','Fontsize',16,'XTick',[-14:2:30],'XMinorTick','on','Yminortick','on','YTick',[0:0.1:1]);
text(-3,0.969543147208122,'B','Fontsize',32,'FontWeight','bold');

print(gcf,'FigureS28','-dpng','-r600');
