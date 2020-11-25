% Produces the plots for contact tracing with an incubation period of 8.29 days
% and no delay in the testing results
clear;
clc;
close all;

Risk=1; % Negative Binomial
tL=2.9; %baseline incubation period
load('ContactTracing_IndexInfect_Contact.mat');
IDSNT=RTot(tLv==tL)';
load('ContactTracing_IndexInfect_Contact_Test_Entry.mat');
IDSTE=RTot(tLv==tL)';
load('ContactTracing_IndexInfect_Contact_Test_Exit.mat');
IDSTX=RTot(tLv==tL)';
load('ContactTracing_IndexInfect_Contact_Test_Entry_Exit.mat');
IDSTEX=RTot(tLv==tL)';

[f1]=RiskChart(IDSNT,IDSTE,IDSTX,IDSTEX,qt,Risk);

print(f1,'FigureS23','-dpng','-r600');

[f1]=FigureChart(IDSNT,IDSTE,IDSTX,IDSTEX,qt);
print(f1,'FigureS22','-dpng','-r600');