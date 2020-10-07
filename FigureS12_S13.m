clear;
clc;
close all;

Risk=1; % Negative Binomial
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

[f1]=RiskChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,tsv,qt,1,Risk);

print(f1,'FigureS13','-dpng','-r600');

[f1]=FigureChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,tsv,qt,1);

print(f1,'FigureS12','-dpng','-r600');