% Random entry in qiaratine with testing on entry and exit
clear;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baseline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
qt=[7]; % Quarantine durations consideredd

SelfIsolate=1; % Self-isolation
tLt=[1.9 2.9 3.9]; % vecotor for the incbation periods to be integrated over

% Allcoate memory for output
IDS=zeros(length(tLt),length(qt)); % Assumes asymptomatic enter during incubation period
IDSL=zeros(length(tLt),length(qt)); % Assumes asymptomatic enter over infections period [0,ts+21]

% Get Basline parameters
[pA,~,R0,ts] = BaselineParameters(tLt(1)); % Does not matter here what ts is fed in 

[q,tLv]=meshgrid(qt,tLt); % Create a mesh grid of the paramters being changes
q=q(:); % Vectorize the matrix
tLv=tLv(:); % Vectorize the matrix
IDSL=IDSL(:); % Vectorize the matrix

td=ts+20; % Asymptomatic increase 20 days from symptom onset

R0S=R0; % Set R0 for symptomatic
R0A=R0; % Set R0 for asymptomatic

for jj=1:3
        % Assumes asymptomatic enter over infections period [0,ts+21]
        IDSL(jj)=(1-pA).*((1./ts).*dblquad(@(u,t)InfectiousnessfromInfectionTestingEntryExit(t+u,u,u+4,R0S,R0A,0,ts,tLv(jj),SelfIsolate),0,ts,q(jj),inf))+pA.*((1./td).*dblquad(@(u,t)InfectiousnessfromInfectionTestingEntryExit(t+u,u,u+4,R0S,R0A,1,ts,tLv(jj),0),0,td,q(jj),inf));  
end

save('TestingonEntry_96hrs_7dayQ.mat');
