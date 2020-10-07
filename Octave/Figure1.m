clear;
clc;
close all;

load('ImpactQuarantine.mat');
IDSNT=reshape(IDSL,length(tsvt),length(qt));
IDSNT=IDSNT(:,2:end);
load('TestingonEntry.mat');
IDSTE=reshape(IDSL,length(tsvt),length(qt));
IDSTE=IDSTE(:,2:end);
load('TestingonExit_OneDayDelay.mat');
IDSTX=reshape(IDSL,length(tsvt),length(qt));

load('TestingonEntryExit_OneDayDelay.mat');
IDSTEX=reshape(IDSL,length(tsvt),length(qt));

tsv=tsvt;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% What probability density function to use for the incubatinop period
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    p=PDFavgIncubation(tsv,tsv(2)-tsv(1));
    p2=PDFavgIncubation_Alt(tsv,tsv(2)-tsv(1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Risk=1; % Does the negative Binomial
% Average probability of onward transmisison
Prob=[(p*Probability_Onward(IDSNT,Risk))' (p*Probability_Onward(IDSTE,Risk))' (p*Probability_Onward(IDSTX,Risk))' (p*Probability_Onward(IDSTEX,Risk))'];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% Reduction in prob due to testing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
RRE=1-Prob(:,2)./Prob(:,1);
RRX=1-Prob(:,3)./Prob(:,1);
RREX=1-Prob(:,4)./Prob(:,1);

fprintf('The minimum reduction of adding testing to quarantine: %3.1f \n',100.*min([min(RRE(:)) min(RRX(:)) min(RREX(:))]));


fprintf('Probability of onward transmission for a quarantine of three days with testing on entry and exit relative to no testing: %3.1f \n',100.*(1-Prob(3,4)./Prob(3,1)));
fprintf('Probability of onward transmission for a quarantine of three days with testing on entry relative to no testing: %3.1f \n',100.*(1-Prob(3,2)./Prob(3,1)));
fprintf('Probability of onward transmission for a quarantine of three days with testing on exit relative to no testing: %3.1f \n',100.*(1-Prob(3,3)./Prob(3,1)));

RRA=1-Prob(:,4)./Prob(:,3);

fprintf('The minimum reduction of adding testing on entry to testing on exit: %3.1f \n',[100.*min(RRA(:))]);
fprintf('The duration in which minimum reduction of adding testing on entry to testing on exit: %d \n',[qt(find(RRA==min(RRA)))]);

RRA2=1-Prob(:,4)./Prob(:,2);
fprintf('The reduction of adding testing on exit to testing on entry for a five day quarantine: %3.1f \n',[100.*(RRA2(qt==5))]);
fprintf('The reduction of adding testing on exit to testing on entry for a seven day quarantine: %3.1f \n',[100.*(RRA2(qt==7))]);

Prob2=[(p2*Probability_Onward(IDSNT,Risk))' (p2*Probability_Onward(IDSTE,Risk))' (p2*Probability_Onward(IDSTX,Risk))' (p2*Probability_Onward(IDSTEX,Risk))'];
CStrat=[hex2rgb('#D13525'); hex2rgb('#F77604'); hex2rgb('#2988BC'); hex2rgb('#54278f')];
figure('units','normalized','outerposition',[0 0.05 0.5 1]);
subplot('Position',[0.14,0.56,0.84,0.42]);

yytick=[0 0.0025 0.01 0.025 0.05:0.05:0.35];
for ii=1:4
    plot(qt,sqrt(Prob(:,ii)),'-o','color',CStrat(ii,:),'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',CStrat(ii,:),'MarkerFaceColor',CStrat(ii,:)); hold on;
end
grid on;
xlim([1 14]);
ylim([ 0 sqrt(0.35)]);
legend({'No testing','Testing on entry','Testing on exit','Testing on both entry and exit'},'Fontsize',14);
        legend boxoff
set(gca,'LineWidth',2,'tickdir','out','XTick',[0:14],'Fontsize',18,'Yminortick','on','YTick',sqrt(yytick),'YTickLabel',{num2str(yytick')})
    box off;
    ylabel({'Probability of post-quarantine','transmission'},'Fontsize',18,'Position',[-0.137650237070408,0.295804276041025,-1]);
%     xlabel('Duration of quarantine','Fontsize',20);
text(-1,sqrt(0.35),'A','Fontsize',32,'FontWeight','bold');
    subplot('Position',[0.14,0.085,0.84,0.42]);
for ii=1:4
    plot(qt,sqrt(Prob2(:,ii)),'-o','color',CStrat(ii,:),'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',CStrat(ii,:),'MarkerFaceColor',CStrat(ii,:)); hold on;
end
grid on;
xlim([1 14]);
ylim([ 0 sqrt(0.35)]);
set(gca,'LineWidth',2,'tickdir','out','XTick',[0:14],'Fontsize',18,'Yminortick','on','YTick',sqrt(yytick),'YTickLabel',{num2str(yytick')})
    box off;
    ylabel({'Probability of post-quarantine','transmission'},'Fontsize',18,'Position',[-0.137650237070408,0.295804276041025,-1]);
    xlabel('Duration of quarantine','Fontsize',20);
    text(-1,sqrt(0.35),'B','Fontsize',32,'FontWeight','bold');
print(gcf,'Figure1','-dpng','-r600');
[f1]=RiskChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,tsv,qt,0,1);

print(f1,'FigureS3','-dpng','-r600');

[f1]=FigureChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,tsv,qt,0);

print(f1,'FigureS2','-dpng','-r600');