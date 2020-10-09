%Produces the plot of the optimal testing day
clear;
close all;
load('TestingonDayt_21DayQ.mat')
DTest=zeros(21,1);
DCT=zeros(21,1);
p=PDFavgIncubation(tsvt,tsvt(2)-tsvt(1));
for ii=1:21
    f=find(qmm==ii);
    fc=find(qmm==ii);
    temp=zeros(ii+1,1);
    temp2=zeros(ii+1,1);
    for jj=0:ii
        ft=find(dtmm(f)==jj);
        temp(jj+1)=p*IDSL(f(ft));
        ft=find(dtmm(fc)==jj);
        temp2(jj+1)=p*RTot(fc(ft));
    end
    DTest(ii)=find(temp==min(temp),1)-1;
    DCT(ii)=find(temp2==min(temp2),1)-1;
end

figure('units','normalized','outerposition',[0 0 1 1]);
subplot('Position',[0.05,0.602558087350318,0.45,0.379328859060402]);
plot([1:21],DTest,'-ok','linewidth',2,'MarkerFaceColor','k','Markersize',10)
xlabel('Duration of quarantine','Fontsize',20);
ylabel('Optimal day to conduct test','Fontsize',20);
ylim([0 8]);
xlim([0.5 21.5]);
set(gca,'LineWidth',2,'tickdir','out','XTick',[1:21],'Fontsize',18,'YTick',[0:1:10]);
box off;
text(-1.089622641509434,7.67914438502674,'A','Fontsize',32,'FontWeight','bold','VerticalAlignment','baseline');

subplot('Position',[0.54,0.602558087350318,0.45,0.379328859060402]);
plot([1:21],DCT,'-ok','linewidth',2,'MarkerFaceColor','k','Markersize',10)
xlabel('Duration of quarantine','Fontsize',20);
ylabel('Optimal day to conduct test','Fontsize',20);
ylim([0 8]);
xlim([0.5 21.5]);
set(gca,'LineWidth',2,'tickdir','out','XTick',[1:21],'Fontsize',18,'YTick',[0:1:10]);
box off;
text(-1.089622641509434,7.67914438502674,'B','Fontsize',32,'FontWeight','bold','VerticalAlignment','baseline');


DTest=zeros(21,1);
DCT=zeros(21,1);
p=PDFavgIncubation_Alt(tsvt,tsvt(2)-tsvt(1));
for ii=1:21
    f=find(qmm==ii);
    fc=find(qmm==ii);
    temp=zeros(ii+1,1);
    temp2=zeros(ii+1,1);
    for jj=0:ii
        ft=find(dtmm(f)==jj);
        temp(jj+1)=p*IDSL(f(ft));
        ft=find(dtmm(fc)==jj);
        temp2(jj+1)=p*RTot(fc(ft));
    end
    DTest(ii)=find(temp==min(temp),1)-1;
    DCT(ii)=find(temp2==min(temp2),1)-1;
end

subplot('Position',[0.05,0.12,0.45,0.379328859060402]);
plot([1:21],DTest,'-ok','linewidth',2,'MarkerFaceColor','k','Markersize',10)
xlabel('Duration of quarantine','Fontsize',20);
ylabel('Optimal day to conduct test','Fontsize',20);
ylim([0 5]);
xlim([0.5 21.5]);
set(gca,'LineWidth',2,'tickdir','out','XTick',[1:21],'Fontsize',18,'YTick',[0:1:10]);
box off;
text(-1.089622641509434,4.79,'C','Fontsize',32,'FontWeight','bold','VerticalAlignment','baseline');

subplot('Position',[0.54,0.12,0.45,0.379328859060402]);
plot([1:21],DCT,'-ok','linewidth',2,'MarkerFaceColor','k','Markersize',10)
xlabel('Duration of quarantine','Fontsize',20);
ylabel('Optimal day to conduct test','Fontsize',20);
ylim([0 5]);
xlim([0.5 21.5]);
set(gca,'LineWidth',2,'tickdir','out','XTick',[1:21],'Fontsize',18,'YTick',[0:1:10]);
box off;
text(-1.089622641509434,4.79,'D','Fontsize',32,'FontWeight','bold','VerticalAlignment','baseline');



print(gcf,'FigureS4','-dpng','-r600');
