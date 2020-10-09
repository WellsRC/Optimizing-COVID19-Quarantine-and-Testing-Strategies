%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Returns results for section on data analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
clc;
close all;
load('Sensirivity_Time_Quarantine.mat')
p=PDFavgIncubation(tsv,tsv(2)-tsv(1));
SS2=p*SS2;

fprintf('Proportion of detected cases identified on exit with self-isolation on symptom onset: %3.1f%% \n',100.*((1-SS2(1)).*SS2(2))./(SS2(1)+(1-SS2(1)).*SS2(2)));

clear;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
% Adding exit to entry
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
load('TestingonEntryExit_OneDayDelay.mat')
p=PDFavgIncubation(tsvt,tsvt(2)-tsvt(1));
IDSL=reshape(IDSL,length(tsvt),length(qt));
PTEX=p*Probability_Onward(IDSL,1);
PTEX5=PTEX(qt==5);

load('TestingonEntry.mat')
p=PDFavgIncubation(tsvt,tsvt(2)-tsvt(1));
IDSL=reshape(IDSL,length(tsvt),length(qt));
PTE=p*Probability_Onward(IDSL,1);
PTE3=PTE(qt==3);

load('TestingonEntry_96hrs_7dayQ.mat')
p=PDFavgIncubation(tsvt,tsvt(2)-tsvt(1));
PTEX7=p*Probability_Onward(IDSL,1);

fprintf('Reduction onward transmission of adding exit to entry for 5-day quaranitine: %3.1f%% \n',100.*(1-PTEX5./PTE3));
fprintf('Reduction onward transmission of adding exit to entry for 7-day quaranitine: %3.1f%% \n',100.*(1-PTEX7./PTE3));

clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
% Risk onward
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55

load('ImpactQuarantine.mat')
p=PDFavgIncubation(tsvt,tsvt(2)-tsvt(1));
IDSL=reshape(IDSL,length(tsvt),length(qt));
PQ=p*Probability_Onward(IDSL,1);
N=15;
fprintf('Probability of onward transmission for 5-day quaranitine with %d cases: %3.1f%% \n',[N 100.*(1-(1-PQ(qt==5)).^N)]);

N=1;
fprintf('Probability of onward transmission for 7-day quaranitine with %d cases: %3.1f%% \n',[N 100.*(1-(1-PQ(qt==7)).^N)]);
