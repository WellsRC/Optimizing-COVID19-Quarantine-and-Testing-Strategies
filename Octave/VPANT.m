% Random entry in qiaratine with testing on entry and exit
clear;

pobj=parpool(6); % Parallel pool
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baseline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
qt=5; % 5 Day quarantine

SelfIsolate=1; % Self-isolation
tLt=[1.9 2.9 3.9]; % vecotor for the incbation periods to be integrated over
pA=[0:0.05:1];
% Allcoate memory for output
IDSL=zeros(length(tLt),length(pA)); % Assumes asymptomatic enter over infections period [0,ts+21]

% Get Basline parameters
[~,~,R0,ts] = BaselineParameters(tLt(1)); % Does not matter here what ts is fed in 


[pAv,tLv]=meshgrid(pA,tLt); % Create a mesh grid of the paramters being changes
pAv=pAv(:); % Vectorize the matrix
tLv=tLv(:); % Vectorize the matrix
IDSL=IDSL(:); % Vectorize the matrix

td=ts+20; % Asymptomatic increase 20 days from symptom onset

R0S=R0; % Set R0 for symptomatic
R0A=R0; % Set R0 for asymptomatic

parfor jj=1:63
    % Assumes asymptomatic enter over infections period [0,ts+21]
        IDSL(jj)=(1-pAv(jj)).*((1./ts).*dblquad(@(u,t)InfectiousnessfromInfection(t+u,R0S,R0A,0,ts,tLv(jj),SelfIsolate),0,ts,qt,inf))+pAv(jj).*((1./td).*dblquad(@(u,t)InfectiousnessfromInfection(t+u,R0S,R0A,1,ts,tLv(jj),0),0,td,qt,inf));  
end

save('VaryPA_NoTesting_5day.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Longer Quarantine
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
qt=7; % 7 Day quarantine

SelfIsolate=1; % Self-isolation
tLt=[1.9 2.9 3.9]; % vecotor for the incbation periods to be integrated over
pA=[0:0.05:1];
% Allcoate memory for output
IDS=zeros(length(tLt),length(pA)); % Assumes asymptomatic enter during incubation period
IDSL=zeros(length(tLt),length(pA)); % Assumes asymptomatic enter over infections period [0,ts+21]

% Get Basline parameters
[~,~,R0,ts] = BaselineParameters(tLt(1)); % Does not matter here what ts is fed in 


[pAv,tLv]=meshgrid(pA,tLt); % Create a mesh grid of the paramters being changes
pAv=pAv(:); % Vectorize the matrix
tLv=tLv(:); % Vectorize the matrix
IDSL=IDSL(:); % Vectorize the matrix

td=ts+20; % Asymptomatic increase 20 days from symptom onset

R0S=R0; % Set R0 for symptomatic
R0A=R0; % Set R0 for asymptomatic

parfor jj=1:63
    % Assumes asymptomatic enter over infections period [0,ts+21]
        IDSL(jj)=(1-pAv(jj)).*((1./ts).*dblquad(@(u,t)InfectiousnessfromInfection(t+u,R0S,R0A,0,ts,tLv(jj),SelfIsolate),0,ts,qt,inf))+pAv(jj).*((1./td).*dblquad(@(u,t)InfectiousnessfromInfection(t+u,R0S,R0A,1,ts,tLv(jj),0),0,td,qt,inf));   
end

save('VaryPA_NoTesting_7day.mat');