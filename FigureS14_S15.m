% Produces the plots for contact tracing w/ no delay in identication with an incubation period of 5.2 days
clear;
clc;
close all;

Risk=1; % Negative Binomial
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

[f1]=RiskChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,tsv,qt,1,Risk);

print(f1,'FigureS15','-dpng','-r600');

[f1]=FigureChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,tsv,qt,1);

print(f1,'FigureS14','-dpng','-r600');