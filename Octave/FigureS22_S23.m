clear;
clc;
close all;

Risk=1; % Negative Binomial
load('ContactTracing_IndexInfect_Contact_pA=226.mat');
IDSNT=reshape(RTot,length(tsvt),length(qt));
IDSNT=IDSNT(:,2:end);
load('ContactTracing_IndexInfect_Contact_Test_Entry_pA=226.mat');
IDSTE=reshape(RTot,length(tsvt),length(qt));
IDSTE=IDSTE(:,2:end);
load('ContactTracing_IndexInfect_Contact_Test_Exit_pA=226_OneDayDelay.mat');
IDSTX=reshape(RTot,length(tsvt),length(qt));
load('ContactTracing_IndexInfect_Contact_Test_Entry_and_Exit_pA=226_OneDayDelay.mat');
IDSTEX=reshape(RTot,length(tsvt),length(qt));

tsv=tsvt;

[f1]=RiskChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,tsv,qt,0,Risk);

print(f1,'FigureS23','-dpng','-r600');

[f1]=FigureChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,tsv,qt,0);
print(f1,'FigureS22','-dpng','-r600');