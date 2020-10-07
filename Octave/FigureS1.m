clear;
close all;
clc;

load('ImpactSelfIsolation_R0=2_5.mat');
pA1=pA;
RS1=RS;
IDS1=IDS;
figure('units','normalized','outerposition',[0 0 1 1]);
panel=1;

p=PDFavgIncubation(tsv,tsv(2)-tsv(1));
tt=[-21:0.05:39];
IDT=zeros(length(tsv),length(tt));
IDST=zeros(length(tsv),length(tt));
for ii=1:length(tsv)
    ff=find(tt>=-tsv(ii));
    IDT(ii,ff)=spline(t-tsv(ii),ID(ii,:),tt(ff));
    IDST(ii,ff)=spline(t-tsv(ii),IDS1(ii,:),tt(ff));
end
ID=p*IDT;
IDS1=p*IDST;

subplot('Position',[0.07+0.49.*rem(panel-1,2) 0.63-0.435*floor((panel-1)/2) 0.42 0.36]);
patch([tt flip(tt)],[IDS1 zeros(size(tt))],hex2rgb('#F5BE41'),'LineStyle','none','Facealpha',0.3); hold on
text(-1.534999999999991,0.1, num2str(round(p*RS1,2)),'Fontsize',16,'HorizontalAlignment','center');

p3=plot(tt,IDS1,'color',hex2rgb('#F5BE41'),'LineWidth',2); hold on
p1=plot(tt,ID,'color',hex2rgb('#2A3132'),'LineWidth',2); hold on


% bar([1:14],ID,'LineStyle','none');
legend([p1 p3],{'No self-isolation',['Self-isolation and ' num2str(100*pA1) '% asymptomatic']},'Fontsize',14);
legend boxoff;
box off;
xlabel('Day of symptom onset','Fontsize',18);
ylabel('Average infectiousness','Fontsize',18);

ylim([0 0.4]);
xlim([-8 12]);
set(gca,'LineWidth',2,'tickdir','out','Fontsize',16,'XTick',[-21:21],'XMinorTick','on','Yminortick','on','YTick',[0:0.1:0.9]);

fprintf('Expected number of infections under no self-isolation: %3.2f \n',p*RNS);
fprintf('Expected number of infections under self-isolation and %3.1f%% asymptomatic: %3.2f \n',[pA1*100 p*RS1]);
text(-10,0.3944,'A','Fontsize',32','FontWeight','bold');

clear;

load('ImpactSelfIsolation_R0=2.mat');
pA1=pA;
RS1=RS;
IDS1=IDS;

panel=2;

p=PDFavgIncubation(tsv,tsv(2)-tsv(1));
tt=[-21:0.05:39];
IDT=zeros(length(tsv),length(tt));
IDST=zeros(length(tsv),length(tt));
for ii=1:length(tsv)
    ff=find(tt>=-tsv(ii));
    IDT(ii,ff)=spline(t-tsv(ii),ID(ii,:),tt(ff));
    IDST(ii,ff)=spline(t-tsv(ii),IDS1(ii,:),tt(ff));
end
ID=p*IDT;
IDS1=p*IDST;

subplot('Position',[0.07+0.49.*rem(panel-1,2) 0.63-0.435*floor((panel-1)/2) 0.42 0.36]);
patch([tt flip(tt)],[IDS1 zeros(size(tt))],hex2rgb('#F5BE41'),'LineStyle','none','Facealpha',0.3); hold on
text(-1.534999999999991,0.1, num2str(round(p*RS1,2)),'Fontsize',16,'HorizontalAlignment','center');

p3=plot(tt,IDS1,'color',hex2rgb('#F5BE41'),'LineWidth',2); hold on
p1=plot(tt,ID,'color',hex2rgb('#2A3132'),'LineWidth',2); hold on


% bar([1:14],ID,'LineStyle','none');
legend([p1 p3],{'No self-isolation',['Self-isolation and ' num2str(100*pA1) '% asymptomatic']},'Fontsize',14);
legend boxoff;
box off;
xlabel('Day of symptom onset','Fontsize',18);
ylabel('Average infectiousness','Fontsize',18);

ylim([0 0.4]);
xlim([-8 12]);
set(gca,'LineWidth',2,'tickdir','out','Fontsize',16,'XTick',[-21:21],'XMinorTick','on','Yminortick','on','YTick',[0:0.1:0.9]);

fprintf('Expected number of infections under no self-isolation: %3.2f \n',p*RNS);
fprintf('Expected number of infections under self-isolation and %3.1f%% asymptomatic: %3.2f \n',[pA1*100 p*RS1]);
text(-10,0.3944,'B','Fontsize',32','FontWeight','bold');



load('ImpactSelfIsolation_R0=2_5_pA=226.mat');
pA1=pA;
RS1=RS;
IDS1=IDS;
panel=3;

p=PDFavgIncubation(tsv,tsv(2)-tsv(1));
tt=[-21:0.05:39];
IDT=zeros(length(tsv),length(tt));
IDST=zeros(length(tsv),length(tt));
for ii=1:length(tsv)
    ff=find(tt>=-tsv(ii));
    IDT(ii,ff)=spline(t-tsv(ii),ID(ii,:),tt(ff));
    IDST(ii,ff)=spline(t-tsv(ii),IDS1(ii,:),tt(ff));
end
ID=p*IDT;
IDS1=p*IDST;

subplot('Position',[0.07+0.49.*rem(panel-1,2) 0.63-0.435*floor((panel-1)/2) 0.42 0.36]);
patch([tt flip(tt)],[IDS1 zeros(size(tt))],hex2rgb('#F5BE41'),'LineStyle','none','Facealpha',0.3); hold on
text(-1.534999999999991,0.1, num2str(round(p*RS1,2)),'Fontsize',16,'HorizontalAlignment','center');

p3=plot(tt,IDS1,'color',hex2rgb('#F5BE41'),'LineWidth',2); hold on
p1=plot(tt,ID,'color',hex2rgb('#2A3132'),'LineWidth',2); hold on


% bar([1:14],ID,'LineStyle','none');
legend([p1 p3],{'No self-isolation',['Self-isolation and ' num2str(100*pA1) '% asymptomatic']},'Fontsize',14);
legend boxoff;
box off;
xlabel('Day of symptom onset','Fontsize',18);
ylabel('Average infectiousness','Fontsize',18);

ylim([0 0.4]);
xlim([-8 12]);
set(gca,'LineWidth',2,'tickdir','out','Fontsize',16,'XTick',[-21:21],'XMinorTick','on','Yminortick','on','YTick',[0:0.1:0.9]);

fprintf('Expected number of infections under no self-isolation: %3.2f \n',p*RNS);
fprintf('Expected number of infections under self-isolation and %3.1f%% asymptomatic: %3.2f \n',[pA1*100 p*RS1]);
text(-10,0.3944,'C','Fontsize',32','FontWeight','bold');

clear;

load('ImpactSelfIsolation_R0=2_pA=226.mat');
pA1=pA;
RS1=RS;
IDS1=IDS;

panel=4;

p=PDFavgIncubation(tsv,tsv(2)-tsv(1));
tt=[-21:0.05:39];
IDT=zeros(length(tsv),length(tt));
IDST=zeros(length(tsv),length(tt));
for ii=1:length(tsv)
    ff=find(tt>=-tsv(ii));
    IDT(ii,ff)=spline(t-tsv(ii),ID(ii,:),tt(ff));
    IDST(ii,ff)=spline(t-tsv(ii),IDS1(ii,:),tt(ff));
end
ID=p*IDT;
IDS1=p*IDST;

subplot('Position',[0.07+0.49.*rem(panel-1,2) 0.63-0.435*floor((panel-1)/2) 0.42 0.36]);
patch([tt flip(tt)],[IDS1 zeros(size(tt))],hex2rgb('#F5BE41'),'LineStyle','none','Facealpha',0.3); hold on
text(-1.534999999999991,0.1, num2str(round(p*RS1,2)),'Fontsize',16,'HorizontalAlignment','center');

p3=plot(tt,IDS1,'color',hex2rgb('#F5BE41'),'LineWidth',2); hold on
p1=plot(tt,ID,'color',hex2rgb('#2A3132'),'LineWidth',2); hold on


% bar([1:14],ID,'LineStyle','none');
legend([p1 p3],{'No self-isolation',['Self-isolation and ' num2str(100*pA1) '% asymptomatic']},'Fontsize',14);
legend boxoff;
box off;
xlabel('Day of symptom onset','Fontsize',18);
ylabel('Average infectiousness','Fontsize',18);

ylim([0 0.4]);
xlim([-8 12]);
set(gca,'LineWidth',2,'tickdir','out','Fontsize',16,'XTick',[-21:21],'XMinorTick','on','Yminortick','on','YTick',[0:0.1:0.9]);

fprintf('Expected number of infections under no self-isolation: %3.2f \n',p*RNS);
fprintf('Expected number of infections under self-isolation and %3.1f%% asymptomatic: %3.2f \n',[pA1*100 p*RS1]);
text(-10,0.3944,'D','Fontsize',32','FontWeight','bold');

print(gcf,'FigureS1','-dpng','-r600');

clear;