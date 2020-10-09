% Produces the plots for contact tracing with a one day delay from index to
% finding contact for incubation period of 8.29 days
clear;
clc;
close all;
Risk=1; % Negative Binomial
load('ContactTracing_IndexInfect_Contact.mat');
IDSNT=reshape(RTotD1,length(tsvt),length(qt));
IDSNT=IDSNT(:,2:end);
load('ContactTracing_IndexInfect_Contact_Test_Entry.mat');
IDSTE=reshape(RTotD1,length(tsvt),length(qt));
IDSTE=IDSTE(:,2:end);
load('ContactTracing_IndexInfect_Contact_Test_Exit_OneDayDelay.mat');
IDSTX=reshape(RTotD1,length(tsvt),length(qt));
load('ContactTracing_IndexInfect_Contact_Test_Entry_and_Exit_OneDayDelay.mat');
IDSTEX=reshape(RTotD1,length(tsvt),length(qt));


tsv=tsvt;

[f1]=RiskChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,tsv,qt,0,Risk);

print(f1,'FigureS10','-dpng','-r600');

[f1]=FigureChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,tsv,qt,0);
print(f1,'FigureS9','-dpng','-r600');