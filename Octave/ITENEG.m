% Random entry in qiaratine with testing on entry
clear;

%pobj=parpool(20); % Parallel pool
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baseline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
qt=[5 7]; % Quarantine durations consideredd

SelfIsolate=1; % Self-isolation
tLt=2.9; % vecotor for the incbation periods to be integrated over

% Allcoate memory for output
IDS=zeros(length(tLt),length(qt)); % Assumes asymptomatic enter during incubation period
IDSL=zeros(length(tLt),length(qt)); % Assumes asymptomatic enter over infections period [0,ts+21]

% Get Basline parameters
[pA,~,R0,ts] = BaselineParameters(tLt); % Does not matter here what ts is fed in 

[q,tL]=meshgrid(qt,tLt); % Create a mesh grid of the paramters being changes
q=q(:); % Vectorize the matrix
tL=tL(:); % Vectorize the matrix
IDS=IDS(:); % Vectorize the matrix
IDSL=IDSL(:); % Vectorize the matrix

td=ts+20; % Asymptomatic increase 20 days from symptom onset

R0S=R0; % Set R0 for symptomatic
R0A=R0; % Set R0 for asymptomatic

nA=zeros(size(tL));
nS=zeros(size(tL));

for ii=1:2
    nA(ii)=quad(@(t)(1-SensitivityvsViralLoad(ViralShedding_Asymptomatic(t,tL(ii)),ts,tL(ii))),0,td);
    nS(ii)=quad(@(t)(1-SensitivityvsViralLoad(ViralShedding_Symptomatic(t,tL(ii)),ts,tL(ii))),0,ts);
end

for jj=1:2 
    % Calling the test on entry function as I need to produce the pdf since it contains the 1-s(t) for nA and nS
        IDSL(jj)=(1-pA).*((1./nS(jj)).*dblquad(@(u,t)InfectiousnessfromInfectionTestingEntry(t+u,u,R0S,R0A,0,ts,tL(jj),SelfIsolate),0,ts,q(jj),inf))+pA.*((1./nA(jj)).*dblquad(@(u,t)InfectiousnessfromInfectionTestingEntry(t+u,u,R0S,R0A,1,ts,tL(jj),0),0,td,q(jj),inf));
end

save('PQTGivenNegative.mat');
