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
    for jj=0:ii
        ft=find(dtmmt(f)==jj);
        temp(jj+1)=IDSLT(f(ft));
        ft=find(dtmmt(fc)==jj);
        temp2(jj+1)=RTotT(fc(ft));
    end
    DTest(ii)=find(temp==min(temp),1)-1;
    DCT(ii)=find(temp2==min(temp2),1)-1;
    
    
    temp=zeros(ii,1);
    temp2=zeros(ii,1);
    for jj=0:(ii-1)
        ft=find(dtmmt(f)==jj);
        temp(jj+1)=IDSLT(f(ft));
        ft=find(dtmmt(fc)==jj);
        temp2(jj+1)=RTotT(fc(ft));
    end
    DTestDelay(ii)=find(temp==min(temp),1)-1;
    DCTDelay(ii)=find(temp2==min(temp2),1)-1;
end

figure('units','normalized','outerposition',[0 0 1 1]);
subplot('Position',[0.05,0.740628166160081,0.434327731092437,0.231925025329279]);
p2=plot([1:21],DTest,'-o','color',[0.7 0.7 0.7],'linewidth',2,'MarkerFaceColor',[0.7 0.7 0.7],'Markersize',7); hold on
p1=plot([1:21],DTestDelay,'-ok','linewidth',2,'MarkerFaceColor','k','Markersize',7); hold on
legend([p1 p2],{'One day delay in obtaining test result','Negligible delay in obtaining test result'},'Position',[0.259628857316381,0.776306916251781,0.220588229518353,0.059270515086803])
legend boxoff
xlabel('Duration of quarantine','Fontsize',20);
ylabel({'Optimal day','to conduct test'},'Fontsize',20);
ylim([0 8]);
xlim([0.5 21.5]);
set(gca,'LineWidth',2,'tickdir','out','XTick',[1:21],'Fontsize',18,'YTick',[0:1:10]);
box off;
text(-1.876805229175696,7.714078882843338,'A','Fontsize',32,'FontWeight','bold','VerticalAlignment','baseline');

subplot('Position',[0.555672268907563,0.740628166160081,0.434327731092437,0.231925025329279]);
p2=plot([1:21],DCT,'-o','color',[0.7 0.7 0.7],'linewidth',2,'MarkerFaceColor',[0.7 0.7 0.7],'Markersize',7); hold on
p1=plot([1:21],DCTDelay,'-ok','linewidth',2,'MarkerFaceColor','k','Markersize',7); hold on

xlabel('Duration of quarantine','Fontsize',20);
ylabel({'Optimal day','to conduct test'},'Fontsize',20);
ylim([0 8]);
xlim([0.5 21.5]);
set(gca,'LineWidth',2,'tickdir','out','XTick',[1:21],'Fontsize',18,'YTick',[0:1:10]);
box off;
text(-1.876805229175696,7.714078882843338,'B','Fontsize',32,'FontWeight','bold','VerticalAlignment','baseline');


load('TestingonDayt_21DayQ.mat')
DTest=zeros(21,1);
DCT=zeros(21,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% Shorter latent period
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

tL=1.9; % shorter latent period

for ii=1:21
    IDSLT=IDSL(tLv==tL);
    RTotT=RTot(tLv==tL);
    qmmt=qmm(tLv==tL);
    dtmmt=dtmm(tLv==tL);
    f=find(qmmt==ii);
    fc=find(qmmt==ii);
    temp=zeros(ii+1,1);
    temp2=zeros(ii+1,1);
    for jj=0:ii
        ft=find(dtmmt(f)==jj);
        temp(jj+1)=IDSLT(f(ft));
        ft=find(dtmmt(fc)==jj);
        temp2(jj+1)=RTotT(fc(ft));
    end
    DTest(ii)=find(temp==min(temp),1)-1;
    DCT(ii)=find(temp2==min(temp2),1)-1;
    
    
    temp=zeros(ii,1);
    temp2=zeros(ii,1);
    for jj=0:(ii-1)
        ft=find(dtmmt(f)==jj);
        temp(jj+1)=IDSLT(f(ft));
        ft=find(dtmmt(fc)==jj);
        temp2(jj+1)=RTotT(fc(ft));
    end
    DTestDelay(ii)=find(temp==min(temp),1)-1;
    DCTDelay(ii)=find(temp2==min(temp2),1)-1;
end

subplot('Position',[0.05,0.4216,0.434327731092437,0.231925025329279]);
p2=plot([1:21],DTest,'-o','color',[0.7 0.7 0.7],'linewidth',2,'MarkerFaceColor',[0.7 0.7 0.7],'Markersize',7); hold on
p1=plot([1:21],DTestDelay,'-ok','linewidth',2,'MarkerFaceColor','k','Markersize',7); hold on


xlabel('Duration of quarantine','Fontsize',20);
ylabel({'Optimal day','to conduct test'},'Fontsize',20);
ylim([0 8]);
xlim([0.5 21.5]);
set(gca,'LineWidth',2,'tickdir','out','XTick',[1:21],'Fontsize',18,'YTick',[0:1:10]);
box off;
text(-1.876805229175696,7.714078882843338,'C','Fontsize',32,'FontWeight','bold','VerticalAlignment','baseline');

subplot('Position',[0.555672268907563,0.4216,0.434327731092437,0.231925025329279]);
p2=plot([1:21],DCT,'-o','color',[0.7 0.7 0.7],'linewidth',2,'MarkerFaceColor',[0.7 0.7 0.7],'Markersize',7); hold on
p1=plot([1:21],DCTDelay,'-ok','linewidth',2,'MarkerFaceColor','k','Markersize',7); hold on


xlabel('Duration of quarantine','Fontsize',20);
ylabel({'Optimal day','to conduct test'},'Fontsize',20);
ylim([0 8]);
xlim([0.5 21.5]);
set(gca,'LineWidth',2,'tickdir','out','XTick',[1:21],'Fontsize',18,'YTick',[0:1:10]);
box off;
text(-1.876805229175696,7.714078882843338,'D','Fontsize',32,'FontWeight','bold','VerticalAlignment','baseline');

load('TestingonDayt_21DayQ.mat')
DTest=zeros(21,1);
DCT=zeros(21,1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% Longer latent period
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
tL=3.9; % longer latent period

for ii=1:21
    IDSLT=IDSL(tLv==tL);
    RTotT=RTot(tLv==tL);
    qmmt=qmm(tLv==tL);
    dtmmt=dtmm(tLv==tL);
    f=find(qmmt==ii);
    fc=find(qmmt==ii);
    temp=zeros(ii+1,1);
    temp2=zeros(ii+1,1);
    for jj=0:ii
        ft=find(dtmmt(f)==jj);
        temp(jj+1)=IDSLT(f(ft));
        ft=find(dtmmt(fc)==jj);
        temp2(jj+1)=RTotT(fc(ft));
    end
    DTest(ii)=find(temp==min(temp),1)-1;
    DCT(ii)=find(temp2==min(temp2),1)-1;
    
    
    temp=zeros(ii,1);
    temp2=zeros(ii,1);
    for jj=0:(ii-1)
        ft=find(dtmmt(f)==jj);
        temp(jj+1)=IDSLT(f(ft));
        ft=find(dtmmt(fc)==jj);
        temp2(jj+1)=RTotT(fc(ft));
    end
    DTestDelay(ii)=find(temp==min(temp),1)-1;
    DCTDelay(ii)=find(temp2==min(temp2),1)-1;
end

subplot('Position',[0.05,0.104,0.434327731092437,0.231925025329279]);
p2=plot([1:21],DTest,'-o','color',[0.7 0.7 0.7],'linewidth',2,'MarkerFaceColor',[0.7 0.7 0.7],'Markersize',7); hold on
p1=plot([1:21],DTestDelay,'-ok','linewidth',2,'MarkerFaceColor','k','Markersize',7); hold on
xlabel('Duration of quarantine','Fontsize',20);
ylabel({'Optimal day','to conduct test'},'Fontsize',20);
ylim([0 8]);
xlim([0.5 21.5]);
set(gca,'LineWidth',2,'tickdir','out','XTick',[1:21],'Fontsize',18,'YTick',[0:1:10]);
box off;
text(-1.876805229175696,7.714078882843338,'E','Fontsize',32,'FontWeight','bold','VerticalAlignment','baseline');

subplot('Position',[0.555672268907563,0.104,0.434327731092437,0.231925025329279]);
p2=plot([1:21],DCT,'-o','color',[0.7 0.7 0.7],'linewidth',2,'MarkerFaceColor',[0.7 0.7 0.7],'Markersize',7); hold on
p1=plot([1:21],DCTDelay,'-ok','linewidth',2,'MarkerFaceColor','k','Markersize',7); hold on
xlabel('Duration of quarantine','Fontsize',20);
ylabel({'Optimal day','to conduct test'},'Fontsize',20);
ylim([0 8]);
xlim([0.5 21.5]);
set(gca,'LineWidth',2,'tickdir','out','XTick',[1:21],'Fontsize',18,'YTick',[0:1:10]);
box off;
text(-1.876805229175696,7.714078882843338,'F','Fontsize',32,'FontWeight','bold','VerticalAlignment','baseline');



print(gcf,'FigureS4','-dpng','-r600');
