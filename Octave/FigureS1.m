
tL=2.9;
close all;
clc;

load('ImpactSelfIsolation_R0=2_5.mat');
figure('units','normalized','outerposition',[0 0 0.85 0.8]);
panel=1;

tt=[linspace(-8.29,0,301) linspace(0,39,5001)]+ts;
ftL=find(tLv==tL);
    ID=pchip(t,ID(ftL,:),tt);
    IDS=pchip(t,IDS(ftL,:),tt);
    RS=RS(ftL);

subplot('Position',[0.05+0.5.*rem(panel-1,2) 0.59-0.49*floor((panel-1)/2) 0.438 0.38]);
patch([tt flip(tt)],[IDS zeros(size(tt))],hex2rgb('#F5BE41'),'LineStyle','none','Facealpha',0.3); hold on
text(-1.534999999999991+ts,0.1, num2str(round(RS,1),'%2.1f'),'Fontsize',16,'HorizontalAlignment','center');

p3=plot(tt,IDS,'color',hex2rgb('#F5BE41'),'LineWidth',2); hold on
p1=plot(tt,ID,'color',hex2rgb('#2A3132'),'LineWidth',2); hold on


% bar([1:14],ID,'LineStyle','none');
legend([p1 p3],{'No self-isolation',['Self-isolation and ' num2str(100*pA) '% asymptomatic']},'Fontsize',14);
legend boxoff;
box off;
xlabel('Days post-infection','Fontsize',18);
ylabel('Infectivity','Fontsize',18);

ylim([0 0.4]);
xlim([0 21]);
set(gca,'LineWidth',2,'tickdir','out','Fontsize',16,'XTick',[-21:21],'XMinorTick','on','Yminortick','on','YTick',[0:0.1:0.9]);

fprintf('Expected number of infections under no self-isolation: %3.2f \n',RNS(ftL));
fprintf('Expected number of infections under self-isolation and %3.1f%% asymptomatic: %3.2f \n',[pA*100 RS]);
fprintf('Expected number of infections during incubation: %3.2f \n',RPre(ftL));
text(-10.545+ts,0.3944,'A','Fontsize',32','FontWeight','bold');



load('ImpactSelfIsolation_R0=2.mat');
panel=2;


tt=[linspace(-8.29,0,301) linspace(0,39,5001)]+ts;
ftL=find(tLv==tL);
    ID=pchip(t,ID(ftL,:),tt);
    IDS=pchip(t,IDS(ftL,:),tt);
    RS=RS(ftL);

subplot('Position',[0.05+0.5.*rem(panel-1,2) 0.59-0.49*floor((panel-1)/2) 0.438 0.38]);
patch([tt flip(tt)],[IDS zeros(size(tt))],hex2rgb('#F5BE41'),'LineStyle','none','Facealpha',0.3); hold on
text(-1.534999999999991+ts,0.1, num2str(round(RS,1),'%2.1f'),'Fontsize',16,'HorizontalAlignment','center');

p3=plot(tt,IDS,'color',hex2rgb('#F5BE41'),'LineWidth',2); hold on
p1=plot(tt,ID,'color',hex2rgb('#2A3132'),'LineWidth',2); hold on


% bar([1:14],ID,'LineStyle','none');
legend([p1 p3],{'No self-isolation',['Self-isolation and ' num2str(100*pA) '% asymptomatic']},'Fontsize',14);
legend boxoff;
box off;
xlabel('Days post-infection','Fontsize',18);
ylabel('Infectivity','Fontsize',18);

ylim([0 0.4]);
xlim([0 21]);
set(gca,'LineWidth',2,'tickdir','out','Fontsize',16,'XTick',[-21:21],'XMinorTick','on','Yminortick','on','YTick',[0:0.1:0.9]);

fprintf('Expected number of infections under no self-isolation: %3.2f \n',RNS(ftL));
fprintf('Expected number of infections under self-isolation and %3.1f%% asymptomatic: %3.2f \n',[pA*100 RS]);
fprintf('Expected number of infections during incubation: %3.2f \n',RPre(ftL));

text(-10.545+ts,0.3944,'B','Fontsize',32','FontWeight','bold');



load('ImpactSelfIsolation_R0=2_5_pA=226.mat');

panel=3;


tt=[linspace(-8.29,0,301) linspace(0,39,5001)]+ts;
ftL=find(tLv==tL);
    ID=pchip(t,ID(ftL,:),tt);
    IDS=pchip(t,IDS(ftL,:),tt);
    RS=RS(ftL);

subplot('Position',[0.05+0.5.*rem(panel-1,2) 0.59-0.49*floor((panel-1)/2) 0.438 0.38]);
patch([tt flip(tt)],[IDS zeros(size(tt))],hex2rgb('#F5BE41'),'LineStyle','none','Facealpha',0.3); hold on
text(-1.534999999999991+ts,0.1, num2str(round(RS,1),'%2.1f'),'Fontsize',16,'HorizontalAlignment','center');

p3=plot(tt,IDS,'color',hex2rgb('#F5BE41'),'LineWidth',2); hold on
p1=plot(tt,ID,'color',hex2rgb('#2A3132'),'LineWidth',2); hold on


% bar([1:14],ID,'LineStyle','none');
legend([p1 p3],{'No self-isolation',['Self-isolation and ' num2str(100*pA) '% asymptomatic']},'Fontsize',14);
legend boxoff;
box off;
xlabel('Days post-infection','Fontsize',18);
ylabel('Infectivity','Fontsize',18);

ylim([0 0.4]);
xlim([0 21]);
set(gca,'LineWidth',2,'tickdir','out','Fontsize',16,'XTick',[-21:21],'XMinorTick','on','Yminortick','on','YTick',[0:0.1:0.9]);

fprintf('Expected number of infections under no self-isolation: %3.2f \n',RNS(ftL));
fprintf('Expected number of infections under self-isolation and %3.1f%% asymptomatic: %3.2f \n',[pA*100 RS]);
fprintf('Expected number of infections during incubation: %3.2f \n',RPre(ftL));

text(-10.545+ts,0.3944,'C','Fontsize',32','FontWeight','bold');



load('ImpactSelfIsolation_R0=2_pA=226.mat');

panel=4;


tt=[linspace(-8.29,0,301) linspace(0,39,5001)]+ts;
ftL=find(tLv==tL);
    ID=pchip(t,ID(ftL,:),tt);
    IDS=pchip(t,IDS(ftL,:),tt);
    RS=RS(ftL);

subplot('Position',[0.05+0.5.*rem(panel-1,2) 0.59-0.49*floor((panel-1)/2) 0.438 0.38]);
patch([tt flip(tt)],[IDS zeros(size(tt))],hex2rgb('#F5BE41'),'LineStyle','none','Facealpha',0.3); hold on
text(-1.534999999999991+ts,0.1, num2str(round(RS,1),'%2.1f'),'Fontsize',16,'HorizontalAlignment','center');

p3=plot(tt,IDS,'color',hex2rgb('#F5BE41'),'LineWidth',2); hold on
p1=plot(tt,ID,'color',hex2rgb('#2A3132'),'LineWidth',2); hold on


% bar([1:14],ID,'LineStyle','none');
legend([p1 p3],{'No self-isolation',['Self-isolation and ' num2str(100*pA) '% asymptomatic']},'Fontsize',14);
legend boxoff;
box off;
xlabel('Days post-infection','Fontsize',18);
ylabel('Infectivity','Fontsize',18);

ylim([0 0.4]);
xlim([0 21]);
set(gca,'LineWidth',2,'tickdir','out','Fontsize',16,'XTick',[-21:21],'XMinorTick','on','Yminortick','on','YTick',[0:0.1:0.9]);

fprintf('Expected number of infections under no self-isolation: %3.2f \n',RNS(ftL));
fprintf('Expected number of infections under self-isolation and %3.1f%% asymptomatic: %3.2f \n',[pA*100 RS]);
fprintf('Expected number of infections during incubation: %3.2f \n',RPre(ftL));

text(-10.545+ts,0.3944,'D','Fontsize',32','FontWeight','bold');

print(gcf,'FigureS1','-dpng','-r600');
