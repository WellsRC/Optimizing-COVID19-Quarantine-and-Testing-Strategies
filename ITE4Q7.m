% Random entry in qiaratine with testing on entry and exit
clear;

pobj=parpool(20); % Parallel pool
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baseline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
qt=[7]; % Quarantine durations consideredd

SelfIsolate=1; % Self-isolation
tsvt=[1:0.1:21]; % vecotor for the incbation periods to be integrated over

% Allcoate memory for output
IDS=zeros(length(tsvt),length(qt)); % Assumes asymptomatic enter during incubation period
IDSL=zeros(length(tsvt),length(qt)); % Assumes asymptomatic enter over infections period [0,ts+21]

% Get Basline parameters
[pA,~,R0] = BaselineParameters(tsvt(1)); % Does not matter here what ts is fed in 

[q,tsv]=meshgrid(qt,tsvt); % Create a mesh grid of the paramters being changes
q=q(:); % Vectorize the matrix
tsv=tsv(:); % Vectorize the matrix
IDSL=IDSL(:); % Vectorize the matrix

td=tsv+20; % Asymptomatic increase 21 days from symptom onset

R0S=R0; % Set R0 for symptomatic
R0A=R0; % Set R0 for asymptomatic

parfor jj=1:201
        % Assumes asymptomatic enter over infections period [0,ts+21]
        IDSL(jj)=(1-pA).*((1./tsv(jj)).*integral2(@(u,t)InfectiousnessfromInfectionTestingEntryExit(t,u,u+4,R0S,R0A,0,tsv(jj),SelfIsolate),0,tsv(jj),@(u)(u+q(jj)),inf))+pA.*((1./td(jj)).*integral2(@(u,t)InfectiousnessfromInfectionTestingEntryExit(t,u,u+4,R0S,R0A,1,tsv(jj),0),0,td(jj),@(u)(u+q(jj)),inf));  
end

save('TestingonEntry_96hrs_7dayQ.mat');
