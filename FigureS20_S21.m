% Produces the plots for quarnatine with an incubation period of 8.29 days
% and pA=22.6%
clear;
clc;
close all;

Risk=1; % Negative Binomial
load('ImpactQuarantine_pA=226.mat');
IDSNT=reshape(IDSL,length(tsvt),length(qt));
IDSNT=IDSNT(:,2:end);
load('TestingonEntry_pA=226.mat');
IDSTE=reshape(IDSL,length(tsvt),length(qt));
IDSTE=IDSTE(:,2:end);
load('TestingonExit_pA=226_OneDayDelay.mat');
IDSTX=reshape(IDSL,length(tsvt),length(qt));

load('TestingonEntryExit_pA=226_OneDayDelay.mat');
IDSTEX=reshape(IDSL,length(tsvt),length(qt));

tsv=tsvt;

[f1]=RiskChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,tsv,qt,0,Risk);

print(f1,'FigureS21','-dpng','-r600');

[f1]=FigureChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,tsv,qt,0);

print(f1,'FigureS20','-dpng','-r600');