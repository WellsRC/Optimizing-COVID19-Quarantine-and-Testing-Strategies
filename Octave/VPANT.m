% Random entry in qiaratine with testing on entry and exit
clear;

%pobj=parpool(20); % Parallel pool
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baseline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
qt=5;

SelfIsolate=1; % Self-isolation
tsvt=[1:0.1:21]; % vecotor for the incbation periods to be integrated over
pA=[0:0.05:1];
% Allcoate memory for output
IDSL=zeros(length(tsvt),length(pA)); % Assumes asymptomatic enter over infections period [0,ts+21]

% Get Basline parameters
[~,~,R0] = BaselineParameters(tsvt(1)); % Does not matter here what ts is fed in 


[pAv,tsv]=meshgrid(pA,tsvt); % Create a mesh grid of the paramters being changes
pAv=pAv(:); % Vectorize the matrix
tsv=tsv(:); % Vectorize the matrix
IDSL=IDSL(:); % Vectorize the matrix

td=tsv+20; % Asymptomatic increase 21 days from symptom onset

R0S=R0; % Set R0 for symptomatic
R0A=R0; % Set R0 for asymptomatic

for jj=1:4221
    % Assumes asymptomatic enter over infections period [0,ts+21]
        IDSL(jj)=(1-pAv(jj)).*((1./tsv(jj)).*dblquad(@(u,t)InfectiousnessfromInfection(t+u,R0S,R0A,0,tsv(jj),SelfIsolate),0,tsv(jj),qt,inf))+pAv(jj).*((1./td(jj)).*dblquad(@(u,t)InfectiousnessfromInfection(t+u,R0S,R0A,1,tsv(jj),0),0,td(jj),qt,inf));
end

save('VaryPA_NoTesting_5day.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Longer Quarantine
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
qt=7; % 7 Day quarantine

SelfIsolate=1; % Self-isolation
tsvt=[1:0.1:21]; % vecotor for the incbation periods to be integrated over
pA=[0:0.05:1];
% Allcoate memory for output
IDSL=zeros(length(tsvt),length(pA)); % Assumes asymptomatic enter over infections period [0,ts+21]

% Get Basline parameters
[~,~,R0] = BaselineParameters(tsvt(1)); % Does not matter here what ts is fed in 


[pAv,tsv]=meshgrid(pA,tsvt); % Create a mesh grid of the paramters being changes
pAv=pAv(:); % Vectorize the matrix
tsv=tsv(:); % Vectorize the matrix
IDSL=IDSL(:); % Vectorize the matrix

td=tsv+20; % Asymptomatic increase 21 days from symptom onset

R0S=R0; % Set R0 for symptomatic
R0A=R0; % Set R0 for asymptomatic

for jj=1:4221
    % Assumes asymptomatic enter over infections period [0,ts+21]
        IDSL(jj)=(1-pAv(jj)).*((1./tsv(jj)).*dblquad(@(u,t)InfectiousnessfromInfection(t+u,R0S,R0A,0,tsv(jj),SelfIsolate),0,tsv(jj),qt,inf))+pAv(jj).*((1./td(jj)).*dblquad(@(u,t)InfectiousnessfromInfection(t+u,R0S,R0A,1,tsv(jj),0),0,td(jj),qt,inf));
end

save('VaryPA_NoTesting_7day.mat');