% Produces the plots for quarnatine with an incubation period of 8.29 days
% and pA=22.6%
clear;
clc;
close all;

Risk=1; % Negative Binomial
tL=2.9; %baseline incubation period
load('ImpactQuarantine_pA=226.mat');
IDSNT=IDSL(tLv==tL);
q=q(tLv==tL);
IDSNT=IDSNT(q>0)';
load('TestingonEntry_pA=226.mat');
IDSTE=IDSL(tLv==tL);
q=q(tLv==tL);
IDSTE=IDSTE(q>0)';
load('TestingonExit_pA=226_OneDayDelay.mat');
IDSTX=IDSL(tLv==tL)';
load('TestingonEntryExit_pA=226_OneDayDelay.mat');
IDSTEX=IDSL(tLv==tL)';

[f1]=RiskChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,qt,Risk);

print(f1,'FigureS25','-dpng','-r600');

[f1]=FigureChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,qt);

print(f1,'FigureS24','-dpng','-r600');