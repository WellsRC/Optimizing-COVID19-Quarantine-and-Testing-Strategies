clear;
clc;
close all;

Risk=1; % Negative Binomial
load('ContactTracing_IndexInfect_Contact.mat');
IDSNT=reshape(RTot,length(tsvt),length(qt));
load('ContactTracing_IndexInfect_Contact_Test_Entry.mat');
IDSTE=reshape(RTot,length(tsvt),length(qt));
load('ContactTracing_IndexInfect_Contact_Test_Exit.mat');
IDSTX=reshape(RTot,length(tsvt),length(qt));
load('ContactTracing_IndexInfect_Contact_Test_Entry_and_Exit.mat');
IDSTEX=reshape(RTot,length(tsvt),length(qt));

tsv=tsvt;

[f1]=RiskChart(IDSNT,IDSTE,IDSTX,IDSTEX,tsv,qt,0,Risk);

print(f1,'FigureS19','-dpng','-r600');

[f1]=FigureChart(IDSNT,IDSTE,IDSTX,IDSTEX,tsv,qt,0);

print(f1,'FigureS18','-dpng','-r600');