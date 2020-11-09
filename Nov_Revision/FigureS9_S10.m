% Produces the plots for contact tracing with a one day delay from index to
% finding contact for incubation period of 8.29 days
clear;
clc;
close all;
Risk=1; % Negative Binomial

tL=2.9; % Baseline latent period

load('ContactTracing_IndexInfect_Contact.mat');
IDSNT=RTotD1(tLv==tL);
q=q(tLv==tL);
IDSNT=IDSNT(q>0)';
load('ContactTracing_IndexInfect_Contact_Test_Entry.mat');
IDSTE=RTotD1(tLv==tL);
q=q(tLv==tL);
IDSTE=IDSTE(q>0)';
load('ContactTracing_IndexInfect_Contact_Test_Exit_Delay.mat');
IDSTX=RTotD1(tLv==tL)';
load('ContactTracing_IndexInfect_Contact_Test_Entry_Exit_Delay.mat');
IDSTEX=RTotD1(tLv==tL)';

[f1]=RiskChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,qt,Risk);

print(f1,'FigureS10','-dpng','-r600');

[f1]=FigureChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,qt);
print(f1,'FigureS9','-dpng','-r600');