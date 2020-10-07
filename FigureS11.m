clear;
close all;
clc;

load('ImpactSelfIsolation_R0=2_5.mat');
figure('units','normalized','outerposition',[0 0 1 1]);
panel=1;
% p=PDFIncubationdt(tsv,tsv(2)-tsv(1));
p=PDFavgIncubation(tsv,tsv(2)-tsv(1));
p2=PDFavgIncubation_Alt(tsv,tsv(2)-tsv(1));
tt=[-21:0.05:39];
IDT=zeros(length(tsv),length(tt));
IDST=zeros(length(tsv),length(tt));
for ii=1:length(tsv)
    ff=find(tt>=-tsv(ii));
    IDT(ii,ff)=spline(t-tsv(ii),ID(ii,:),tt(ff));
end
ID=p*IDT;
IDA=p2*IDT;
fprintf('Maximim 8.29 days incubation period: %4.3f (%3.2f days) \n',[max(ID) tt(find(ID==max(ID)))]);
fprintf('Maximim 5.2 days incubation period: %4.3f (%3.2f days) \n',[max(IDA) tt(find(IDA==max(IDA)))]);
subplot('Position',[0.07+0.49.*rem(panel-1,2) 0.60-0.42*floor((panel-1)/2) 0.42 0.36]);
t2=linspace(-21,0,1001);
% patch([t2 flip(t2)],[pchip(tt,ID,t2) zeros(size(t2))],[0.7 0.7 0.7],'LineStyle','none','Facealpha',0.3); hold on

p3=plot(tt,IDA,'-.','color',hex2rgb('#66A5AD'),'LineWidth',2); hold on
p1=plot(tt,ID,'color',hex2rgb('#2A3132'),'LineWidth',2); hold on
text(-0.959999999999997,0.193258426966292, num2str(round(p*RPre,2)),'color',hex2rgb('#2A3132'),'Fontsize',16,'HorizontalAlignment','center');
text(-0.959999999999997,0.143258426966292, num2str(round(p2*RPre,2)),'color',hex2rgb('#66A5AD'),'Fontsize',16,'HorizontalAlignment','center');
plot(zeros(101,1),linspace(0,max([(ID(tt==0)) (IDA(tt==0))]),101),'-.','color',[0.7 0.7 0.7],'LineWidth',1.5)
% bar([1:14],ID,'LineStyle','none');
legend([p1 p3],{'8.29 days (Qin et al, 2020)',['5.2 days (Li et al, 2020)']},'Fontsize',14);
legend boxoff;
box off;
xlabel('Day of symptom onset','Fontsize',18);
ylabel('Average infectiousness','Fontsize',18);

ylim([0 0.4]);
xlim([-8 12]);
set(gca,'LineWidth',2,'tickdir','out','Fontsize',16,'XTick',[-21:21],'XMinorTick','on','Yminortick','on','YTick',[0:0.1:0.9]);

fprintf('Expected number of infections under no self-isolation: %3.2f \n',p*RNS);
fprintf('Expected number of infections under self-isolation and %3.1f%% asymptomatic: %3.2f \n',[pA*100 p*RS]);


print(gcf,'FigureS11','-dpng','-r600');
