%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Returns results for section on data analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
% Adding exit to entry
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
tL=2.9;
load('TestingonEntryExit_OneDayDelay.mat')
IDSL=IDSL(tLv==tL);
PTEX=Probability_Onward(IDSL,1);
PTEX5=PTEX(qt==5);

load('TestingonEntry.mat')
IDSL=IDSL(tLv==tL);
PTE=Probability_Onward(IDSL,1);
PTE3=PTE(qt==3);

load('TestingonEntry_96hrs_7dayQ.mat')
IDSL=IDSL(tLv==tL);
PTEX7=Probability_Onward(IDSL,1);

fprintf('Reduction onward transmission of adding exit to entry for 5-day quaranitine: %2.0f%% \n',100.*(1-PTEX5./PTE3));
fprintf('Reduction onward transmission of adding exit to entry for 7-day quaranitine: %2.0f%% \n',100.*(1-PTEX7./PTE3));

clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
% Risk onward
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
load('PQTGivenNegative.mat');
IDSL5=IDSL(qt==5);
PQ5=Probability_Onward(IDSL5,1);

IDSL7=IDSL(qt==7);
PQ7=Probability_Onward(IDSL7,1);


N=15;
TC5=(N.*IDSL5);
fprintf('Probability of onward transmission for 5-day quaranitine with %d cases: %2.0f%% \n',[N 100.*(1-(1-PQ5).^N)]);
fprintf('Expected cases for 5-day quaranitine with %d cases: %3.2f \n',[N TC5]);

N=1;
TC7=(N.*IDSL7);
fprintf('Probability of onward transmission for 7-day quaranitine with %d cases: %3.1f%% \n',[N 100.*(1-(1-PQ7).^N)]);
fprintf('Expected cases for 7-day quaranitine with %d cases: %3.2f \n',[N TC7]);
