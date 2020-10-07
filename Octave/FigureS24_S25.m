clear;
clc;
close all;

Risk=0; %Poisson
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

[f1]=RiskChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,tsv,qt,0,Risk);

print(f1,'FigureS24','-dpng','-r600');

clear;
clc;
close all;
Risk=0; %Poisson
load('ContactTracing_IndexInfect_Contact.mat');
IDSNT=reshape(RTot,length(tsvt),length(qt));
IDSNT=IDSNT(:,2:end);
load('ContactTracing_IndexInfect_Contact_Test_Entry.mat');
IDSTE=reshape(RTot,length(tsvt),length(qt));
IDSTE=IDSTE(:,2:end);
load('ContactTracing_IndexInfect_Contact_Test_Exit_OneDayDelay.mat');
IDSTX=reshape(RTot,length(tsvt),length(qt));
load('ContactTracing_IndexInfect_Contact_Test_Entry_and_Exit_OneDayDelay.mat');
IDSTEX=reshape(RTot,length(tsvt),length(qt));

tsv=tsvt;

[f1]=RiskChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,tsv,qt,0,Risk);

print(f1,'FigureS25','-dpng','-r600');
