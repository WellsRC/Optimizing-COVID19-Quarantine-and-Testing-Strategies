% Produces the plots for quarnatine with an incubation period of 8.29 days
% and no delay in the testing results
clear;
clc;
close all;

Risk=1; % Negative Binomial
tL=2.9; %baseline incubation period
load('ImpactQuarantine.mat');
IDSNT=IDSL(tLv==tL)';
load('TestingonEntry.mat');
IDSTE=IDSL(tLv==tL)';
load('TestingonExit.mat');
IDSTX=IDSL(tLv==tL)';
load('TestingonEntryExit.mat');
IDSTEX=IDSL(tLv==tL)';

[f1]=RiskChart(IDSNT,IDSTE,IDSTX,IDSTEX,qt,Risk);

print(f1,'FigureS21','-dpng','-r600');

[f1]=FigureChart(IDSNT,IDSTE,IDSTX,IDSTEX,qt);

print(f1,'FigureS20','-dpng','-r600');