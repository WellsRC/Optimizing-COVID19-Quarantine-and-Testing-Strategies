%Time of entry into quarantine
clear;
close all;
clc;
tL=2.9;
[pA,IncubationI,R0,ts] = BaselineParameters(tL);

t=linspace(0,ts,1001);
td=ts+20;
figure('units','normalized','outerposition',[0.2 0 0.5 1]);

subplot('Position',[0.12 0.62 0.86 0.37]);
plot(t,DurationInfected(t,IncubationI,ts,tL),'k',t,(1./ts).*ones(1001,1),'b',t,(1./td).*ones(1001,1),'r','LineWidth',2)
xlim([0 ts]);
ylim([0 0.35]);
legend({'Contact tracing (infected by index)','Uniform symptomatic','Uniform asymptomatic'})
legend boxoff;
xlabel({'Day post-infection of contact infected','by symptomatic index'},'Fontsize',18);
ylabel('Density','Fontsize',18);
box off;
set(gca,'LineWidth',2,'tickdir','out','Fontsize',16,'XTick',[0:8],'XMinorTick','on','Yminortick','on','YTick',[0:0.05:0.35]);
text(-9.346465517241+ts,0.3455,'A','Fontsize',32,'Fontweight','bold');
subplot('Position',[0.12 0.13 0.86 0.37]);
t=linspace(ts,td,1001);
AS=InfectiousnessfromInfection(t,R0,R0,1,ts,tL,0)./integral(@(u)(InfectiousnessfromInfection(u,R0,R0,1,ts,tL,0)),ts,inf);

plot(t,AS,'k',t,(1./td).*ones(1001,1),'r','LineWidth',2)
xlim([ts td]);
ylim([0 0.35]);
legend({'Contact tracing (infected the index)','Uniform asymptomatic'})
legend boxoff;
xlabel({'Day post-infection of asymptomatic contact who infected','the symptomatic index'},'Fontsize',18);
ylabel('Density','Fontsize',18);
box off;
set(gca,'LineWidth',2,'tickdir','out','Fontsize',16,'XTick',[8:28],'XMinorTick','on','Yminortick','on','YTick',[0:0.05:0.35]);
text(-2.600+ts,0.3455,'B','Fontsize',32,'Fontweight','bold');


print(gcf,'FigureS31','-dpng','-r600');