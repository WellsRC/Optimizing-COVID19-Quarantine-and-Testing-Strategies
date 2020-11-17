% Produces the plots for contact tracing with an incubation period of 8.29 days
% and pA=22.6%
clear;
clc;
close all;

Risk=1; % Negative Binomial
tL=2.9; %baseline incubation period
load('ContactTracing_IndexInfect_Contact_pA=226.mat');
IDSNT=RTot(tLv==tL);
q=q(tLv==tL);
IDSNT=IDSNT(q>0)';
load('ContactTracing_IndexInfect_Contact_Test_Entry_pA=226.mat');
IDSTE=RTot(tLv==tL);
q=q(tLv==tL);
IDSTE=IDSTE(q>0)';
load('ContactTracing_IndexInfect_Contact_Test_Exit_Delay_pA=226.mat');
IDSTX=RTot(tLv==tL)';
load('ContactTracing_IndexInfect_Contact_Test_Entry_Exit_Delay_pA=226.mat');
IDSTEX=RTot(tLv==tL)';

[f1]=RiskChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,qt,Risk);

print(f1,'FigureS27','-dpng','-r600');

[f1]=FigureChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,qt);
print(f1,'FigureS26','-dpng','-r600');