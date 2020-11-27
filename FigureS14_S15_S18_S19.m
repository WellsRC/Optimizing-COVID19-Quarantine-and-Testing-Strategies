% Plots the tables for uniform entry and contact tracing for the latent
% period of 3.9 days
clear;
clc;
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Uniform entry
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Risk=1;

load('ImpactQuarantine.mat');
tL=3.9;
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

%Plot the corresponding SI figures
[f1]=RiskChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,qt,Risk);

print(f1,'FigureS15','-dpng','-r600');

[f1]=FigureChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,qt);

print(f1,'FigureS14','-dpng','-r600');

clear;
clc;
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Contact tracing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Risk=1;

tL=3.9; % Baseline latent period
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

print(f1,'FigureS19','-dpng','-r600');

[f1]=FigureChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,qt);
print(f1,'FigureS18','-dpng','-r600');
