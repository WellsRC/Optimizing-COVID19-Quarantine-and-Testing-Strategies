%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% Panels E and F w/ prevlaence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
clear;
close all;
clc;

load('TestingonEntry.mat');
IDSTE=reshape(IDSL,length(tsvt),length(qt));

IDSTE=IDSTE(:,2:end);
load('TestingonExit_OneDayDelay.mat');
IDSTX=reshape(IDSL,length(tsvt),length(qt));

load('TestingonEntryExit_OneDayDelay.mat');
IDSTEX=reshape(IDSL,length(tsvt),length(qt));

tsv=tsvt;

p=PDFavgIncubation(tsvt,tsvt(2)-tsvt(1));

TE=p*Probability_Onward(IDSTE,1);
TEX=p*Probability_Onward(IDSTEX,1);
TX=p*Probability_Onward(IDSTX,1);

TEd=[ 0 0 0 0];
TEXd=[ 0 0 0 0];
TXd=[0 0 0 0];

TEd(1)=TE(qt==3);
TEXd(1)=TEX(qt==3);
TXd(1)=TX(qt==3);

TEd(2)=TE(qt==5);
TEXd(2)=TEX(qt==5);
TXd(2)=TX(qt==5);

TEd(3)=TE(qt==7);
TEXd(3)=TEX(qt==7);
TXd(3)=TX(qt==7);

TEd(4)=TE(qt==14);
TEXd(4)=TEX(qt==14);
TXd(4)=TX(qt==14);

prev=linspace(0.0001,0.025,10000);
N=40;

CStrat=[hex2rgb('#D13525'); hex2rgb('#F77604'); hex2rgb('#2988BC'); hex2rgb('#54278f')];
figure('units','normalized','outerposition',[0 0 1 1]);
for ii=1:2
    subplot('Position',[0.065+(0.555-0.065).*(ii-1),0.56,0.425,0.4]);
    semilogy(prev,(1-(1-TEd(ii)).^(N.*prev)),'color',CStrat(2,:),'LineWidth',2); hold on
    semilogy(prev,(1-(1-TXd(ii)).^(N.*prev)),'color',CStrat(3,:),'LineWidth',2); hold on
    semilogy(prev,(1-(1-TEXd(ii)).^(N.*prev)),'color',CStrat(4,:),'LineWidth',2); hold on
    if(ii==1)
        legend({'Testing on entry','Testing on exit','Testing on both entry and exit'},'Fontsize',14,'Position',[0.060224089635854,0.888888891062919,0.155987391107473,0.078014182223133]);
        legend boxoff
    end
    set(gca,'LineWidth',2,'tickdir','out','XTick',[0.0001 0.005:0.005:0.025],'Xminortick','on','Fontsize',18,'Yminortick','on','YTick',10.^[-6:0])
    box off;
    ylabel({'Probability of post-quarantine','transmission'},'Fontsize',18);
    xlabel('Prevalence','Fontsize',20);
    ylim([10^(-6) 1]);
    xlim
    text(-0.0037,max(ylim),char(64+ii),'Fontsize',32,'FontWeight','bold','VerticalAlignment','baseline');
end

for ii=1:2
    subplot('Position',[0.065+(0.555-0.065).*(ii-1),0.08,0.425,0.4]);
    
    semilogy(prev,(1-(1-TEd(ii+2)).^(N.*prev)),'color',CStrat(2,:),'LineWidth',2); hold on
    semilogy(prev,(1-(1-TXd(ii+2)).^(N.*prev)),'color',CStrat(3,:),'LineWidth',2); hold on
    semilogy(prev,(1-(1-TEXd(ii+2)).^(N.*prev)),'color',CStrat(4,:),'LineWidth',2); hold on
    
    set(gca,'LineWidth',2,'tickdir','out','XTick',[0.0001 0.005:0.005:0.025],'Xminortick','on','Fontsize',18,'Yminortick','on','YTick',10.^[-6:0])
    box off;
    ylabel({'Probability of post-quarantine','transmission'},'Fontsize',18);
    xlabel('Prevalence','Fontsize',20);
    ylim([10^(-6) 1]);
    text(-0.0037,max(ylim),char(66+ii),'Fontsize',32,'FontWeight','bold','VerticalAlignment','baseline');
end

print(gcf,'FigureS6','-dpng','-r600');

prevInt=0.01;
FE=1-(1-TEd(2)).^(N.*prev);
FEX=1-(1-TEXd(2)).^(N.*prev);

fprintf('Probability of onward transmission for cre size of %d for quarantine of five days for testing on entry only with a prevlaence of %3.1f%%: %3.1f%% \n',[N 100.*prevInt 100.*spline(prev,FE,prevInt)]);
fprintf('Probability of onward transmission for cre size of %d for quarantine of five days for testing on both entry and exit with a prevlaence of %3.1f%%: %3.1f%% \n',[N 100.*prevInt  100.*spline(prev,FEX,prevInt)]);


FE=1-(1-TEd(3)).^(N.*prev);
FEX=1-(1-TEXd(3)).^(N.*prev);

fprintf('Probability of onward transmission for cre size of %d for quarantine of seven days for testing on entry only with a prevlaence of %3.1f%%: %3.1f%% \n',[N 100.*prevInt 100.*spline(prev,FE,prevInt)]);
fprintf('Probability of onward transmission for cre size of %d for quarantine of seven days for testing on both entry and exit with a prevlaence of %3.1f%%: %3.1f%% \n',[N 100.*prevInt  100.*spline(prev,FEX,prevInt)]);

