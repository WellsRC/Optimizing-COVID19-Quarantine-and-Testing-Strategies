% Random entry in qiaratine with testing on exit
clear;

pobj=parpool(20); % Parallel pool
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baseline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
qt=[1:21]; % Quarantine durations consideredd

SelfIsolate=1; % Self-isolation
tLt=[2 3 4]; % vecotor for the incbation periods to be integrated over

% Allcoate memory for output
IDSL=zeros(length(tLt),length(qt)); % Assumes asymptomatic enter over infections period [0,ts+21]

% Get Basline parameters
[pA,~,R0,ts] = BaselineParameters(tLt(1)); % Does not matter here what ts is fed in 

[q,tLv]=meshgrid(qt,tLt); % Create a mesh grid of the paramters being changes
q=q(:); % Vectorize the matrix
tLv=tLv(:); % Vectorize the matrix
IDSL=IDSL(:); % Vectorize the matrix

td=ts+20; % Asymptomatic increase 21 days from symptom onset

R0S=R0; % Set R0 for symptomatic
R0A=R0; % Set R0 for asymptomatic

parfor jj=1:63 
    % Assumes asymptomatic enter over infections period [0,ts+21]
        IDSL(jj)=(1-pA).*(integral(@(t)InfectiousnessfromInfectionTestingEntry(t,q(jj)-1,R0S,R0A,0,ts,tLv(jj),SelfIsolate),q(jj),inf))+pA.*(integral(@(t)InfectiousnessfromInfectionTestingEntry(t,q(jj)-1,R0S,R0A,1,ts,tLv(jj),0),q(jj),inf));  
end

save('Known_Infection_TestingonExit_OneDayDelay.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Less Asymptomatic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
qt=[1:21]; % Quarantine durations consideredd

SelfIsolate=1; % Self-isolation
tLt=[2 3 4]; % vecotor for the incbation periods to be integrated over

% Allcoate memory for output
IDSL=zeros(length(tLt),length(qt)); % Assumes asymptomatic enter over infections period [0,ts+21]

% Get Basline parameters
[~,~,R0,ts] = BaselineParameters(tLt(1)); % Does not matter here what ts is fed in 
pA=0.226;

[q,tLv]=meshgrid(qt,tLt); % Create a mesh grid of the paramters being changes
q=q(:); % Vectorize the matrix
tLv=tLv(:); % Vectorize the matrix
IDSL=IDSL(:); % Vectorize the matrix

td=ts+20; % Asymptomatic increase 21 days from symptom onset

R0S=R0; % Set R0 for symptomatic
R0A=R0; % Set R0 for asymptomatic

parfor jj=1:63  
    % Assumes asymptomatic enter over infections period [0,ts+21]
        IDSL(jj)=(1-pA).*(integral(@(t)InfectiousnessfromInfectionTestingEntry(t,q(jj)-1,R0S,R0A,0,ts,tLv(jj),SelfIsolate),q(jj),inf))+pA.*(integral(@(t)InfectiousnessfromInfectionTestingEntry(t,q(jj)-1,R0S,R0A,1,ts,tLv(jj),0),q(jj),inf));  
end
save('Known_Infection_TestingonExit_pA=226_OneDayDelay.mat');
