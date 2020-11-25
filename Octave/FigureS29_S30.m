% Produces the plots for quarnatine and contact tracing with an incubation period of 8.29 days
% and Poisson distribution
clear;
clc;
close all;

Risk=0; %Poisson
load('ImpactQuarantine.mat');
tL=2.9;
IDSNT=IDSL(tLv==tL);
q=q(tLv==tL);
IDSNT=IDSNT(q>0)';
load('TestingonEntry.mat');
IDSTE=IDSL(tLv==tL);
q=q(tLv==tL);
IDSTE=IDSTE(q>0)';
load('TestingonExit_OneDayDelay.mat');
IDSTX=IDSL(tLv==tL)';
load('TestingonEntryExit_OneDayDelay.mat');
IDSTEX=IDSL(tLv==tL)';

[f1]=RiskChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,qt,Risk);

print(f1,'FigureS29','-dpng','-r600');

clear;
clc;
close all;
Risk=0; %Poisson

tL=2.9; % Baseline latent period
load('ContactTracing_IndexInfect_Contact.mat');
IDSNT=RTot(tLv==tL);
q=q(tLv==tL);
IDSNT=IDSNT(q>0)';
load('ContactTracing_IndexInfect_Contact_Test_Entry.mat');
IDSTE=RTot(tLv==tL);
q=q(tLv==tL);
IDSTE=IDSTE(q>0)';
load('ContactTracing_IndexInfect_Contact_Test_Exit_Delay.mat');
IDSTX=RTot(tLv==tL)';
load('ContactTracing_IndexInfect_Contact_Test_Entry_Exit_Delay.mat');
IDSTEX=RTot(tLv==tL)';

[f1]=RiskChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,qt,Risk);

print(f1,'FigureS30','-dpng','-r600');
