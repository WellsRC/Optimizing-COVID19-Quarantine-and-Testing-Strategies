%Produces the plot of the optimal testing day
clear;
close all;
load('TestingonDayt_21DayQ.mat')
DTest=zeros(21,1);
DCT=zeros(21,1);

DTestDelay=zeros(21,1);
DCTDelay=zeros(21,1);

tL=2.9; % Baseline latent period

for ii=1:21
    IDSLT=IDSL(tLv==tL);
    RTotT=RTot(tLv==tL);
    qmmt=qmm(tLv==tL);
    dtmmt=dtmm(tLv==tL);
    f=find(qmmt==ii);
    fc=find(qmmt==ii);
    temp=zeros(ii+1,1);
    temp2=zeros(ii+1,1);
    
    % No delay
    for jj=0:ii
        ft=find(dtmmt(f)==jj);
        temp(jj+1)=IDSLT(f(ft));
        ft=find(dtmmt(fc)==jj);
        temp2(jj+1)=RTotT(fc(ft));
    end
    DTest(ii)=find(temp==min(temp),1)-1;
    DCT(ii)=find(temp2==min(temp2),1)-1;
    
   
    % Delay
    
    
    temp=zeros(ii,1);
    temp2=zeros(ii,1);
    
    for jj=0:(ii-1) % Cannot test the last day of quarantine
        ft=find(dtmmt(f)==jj);
        temp(jj+1)=IDSLT(f(ft));
        ft=find(dtmmt(fc)==jj);
        temp2(jj+1)=RTotT(fc(ft));
    end
    DTestDelay(ii)=find(temp==min(temp),1)-1;
    DCTDelay(ii)=find(temp2==min(temp2),1)-1;
end

figure('units','normalized','outerposition',[0.05 0.05 0.5 0.6]);
subplot('Position',[0.14,0.145,0.84,0.84]);
p2=plot([1:14],DTest(1:14),'-o','color',[0.7 0.7 0.7],'linewidth',2,'MarkerFaceColor',[0.7 0.7 0.7],'Markersize',7); hold on
p1=plot([1:14],DTestDelay(1:14),'-ok','linewidth',2,'MarkerFaceColor','k','Markersize',7);
legend([p1 p2],{'One-day delay in obtaining test result','Negligible delay in obtaining test result'},'Fontsize',14)
legend boxoff;
xlabel('Duration of quarantine','Fontsize',20);
ylabel({'Optimal day','to conduct test'},'Fontsize',20);
ylim([0 8]);
xlim([0.5 14]);
set(gca,'LineWidth',2,'tickdir','out','XTick',[1:21],'Fontsize',18,'YTick',[0:1:10]);
box off;
text(-1.706,7.559903293978241,'B','Fontsize',32,'FontWeight','bold','VerticalAlignment','baseline');
print(gcf,'Figure1B','-dpng','-r600');
print(gcf,'Figure1B','-depsc','-r600');

figure('units','normalized','outerposition',[0.05 0.05 0.5 0.6]);
subplot('Position',[0.14,0.145,0.84,0.84]);

p2=plot([1:14],DCT(1:14),'-o','color',[0.7 0.7 0.7],'linewidth',2,'MarkerFaceColor',[0.7 0.7 0.7],'Markersize',7); hold on
p1=plot([1:14],DCTDelay(1:14),'-ok','linewidth',2,'MarkerFaceColor','k','Markersize',7);
legend([p1 p2],{'One-day delay in obtaining test result','Negligible delay in obtaining test result'},'Fontsize',14)
legend boxoff;

xlabel('Duration of quarantine','Fontsize',20);
ylabel({'Optimal day','to conduct test'},'Fontsize',20);
ylim([0 8]);
xlim([0.5 14]);
set(gca,'LineWidth',2,'tickdir','out','XTick',[1:21],'Fontsize',18,'YTick',[0:1:10]);
box off;
text(-1.706,7.559903293978241,'B','Fontsize',32,'FontWeight','bold','VerticalAlignment','baseline');
print(gcf,'Figure3B','-dpng','-r600');
print(gcf,'Figure3B','-depsc','-r600');