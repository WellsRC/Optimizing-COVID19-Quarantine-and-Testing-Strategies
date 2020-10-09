% Produces the plots for quarnatine with an incubation period of 8.29 days
% with no delay for obtaining the results
clear;
clc;
close all;

Risk=1; % Negative Binomial
load('ImpactQuarantine.mat');
IDSNT=reshape(IDSL,length(tsvt),length(qt));
load('TestingonEntry.mat');
IDSTE=reshape(IDSL,length(tsvt),length(qt));
load('TestingonExit.mat');
IDSTX=reshape(IDSL,length(tsvt),length(qt));

load('TestingonEntryExit.mat');
IDSTEX=reshape(IDSL,length(tsvt),length(qt));

tsv=tsvt;

[f1]=RiskChart(IDSNT,IDSTE,IDSTX,IDSTEX,tsv,qt,0,Risk);

print(f1,'FigureS17','-dpng','-r600');

[f1]=FigureChart(IDSNT,IDSTE,IDSTX,IDSTEX,tsv,qt,0);

print(f1,'FigureS16','-dpng','-r600');