%diagnostic sensitivity plots
clear;
close all;
clc;
ts=7.76;
td=ts+20;
t=linspace(0,ts,1001);
[pA,IncubationI,R0] = BaselineParameters(ts);

figure('units','normalized','outerposition',[0.2 0 0.5 1]);

subplot('Position',[0.12 0.59 0.86 0.4]);
plot(t-ts,DurationInfected(t,IncubationI,ts),'k',t-ts,(1./ts).*ones(1001,1),'b',t-ts,(1./td).*ones(1001,1),'r','LineWidth',2)
xlim([-ts 0]);
ylim([0 0.35]);
legend({'Contact tracing','Uniform symptomatic','Uniform asymptomatic'})
legend boxoff;
xlabel('Day of symptom onset','Fontsize',18);
ylabel('Density','Fontsize',18);
box off;
set(gca,'LineWidth',2,'tickdir','out','Fontsize',16,'XTick',[-7:0],'XMinorTick','on','Yminortick','on','YTick',[0:0.05:0.35]);
text(-8.764532019704433,0.3455,'A','Fontsize',32,'Fontweight','bold');
subplot('Position',[0.12 0.1 0.86 0.4]);
t=linspace(ts,td,1001);
AS=InfectiousnessfromInfection(t,R0,R0,1,ts,0)./integral(@(u)(InfectiousnessfromInfection(u,R0,R0,1,ts,0)),ts,inf);

plot(t-ts,AS,'k',t-ts,(1./td).*ones(1001,1),'r','LineWidth',2)
xlim([0 td-ts]);
ylim([0 0.25]);
legend({'Contact tracing','Uniform asymptomatic'})
legend boxoff;
xlabel('Day of symptom onset','Fontsize',18);
ylabel('Density','Fontsize',18);
box off;
set(gca,'LineWidth',2,'tickdir','out','Fontsize',16,'XTick',[0:20],'XMinorTick','on','Yminortick','on','YTick',[0:0.05:0.35]);
text(-2.600,0.25,'B','Fontsize',32,'Fontweight','bold');


print(gcf,'FigureS28','-dpng','-r600');