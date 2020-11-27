% Random entry in qiaratine with testing on exit
clear;

pobj=parpool(20); % Parallel pool
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baseline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
qt=[1:21]; % Quarantine durations consideredd

SelfIsolate=1; % Self-isolation
tLt=[1.9 2.9 3.9]; % vecotor for the incbation periods to be integrated over

% Allcoate memory for output
IDSL=zeros(length(tLt),length(qt)); % Assumes asymptomatic enter over infections period [0,ts+21]

% Get Basline parameters
[pA,~,R0,ts,td] = BaselineParameters(tLt(1)); % Does not matter here what ts is fed in 

[q,tLv]=meshgrid(qt,tLt); % Create a mesh grid of the paramters being changes
q=q(:); % Vectorize the matrix
tLv=tLv(:); % Vectorize the matrix
IDSL=IDSL(:); % Vectorize the matrix

%td=ts+20; % Asymptomatic increase 20 days from symptom onset

R0S=R0; % Set R0 for symptomatic
R0A=R0; % Set R0 for asymptomatic

parfor jj=1:63  
    % Assumes asymptomatic enter over infections period [0,ts+21]
        IDSL(jj)=(1-pA).*((1./ts).*integral2(@(u,t)InfectiousnessfromInfectionTestingEntry(t,u+q(jj)-1,R0S,R0A,0,ts,td,tLv(jj),SelfIsolate),0,ts,@(u)(u+q(jj)),inf))+pA.*((1./td).*integral2(@(u,t)InfectiousnessfromInfectionTestingEntry(t,u+q(jj)-1,R0S,R0A,1,ts,td,tLv(jj),0),0,td,@(u)(u+q(jj)),inf));  
end

save('TestingonExit_OneDayDelay.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Less Asymptomatic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
qt=[1:21]; % Quarantine durations consideredd

SelfIsolate=1; % Self-isolation
tLt=[1.9 2.9 3.9]; % vecotor for the incbation periods to be integrated over

% Allcoate memory for output
IDSL=zeros(length(tLt),length(qt)); % Assumes asymptomatic enter over infections period [0,ts+21]

% Get Basline parameters
[~,~,R0,ts,td] = BaselineParameters(tLt(1)); % Does not matter here what ts is fed in 
pA=0.226;

[q,tLv]=meshgrid(qt,tLt); % Create a mesh grid of the paramters being changes
q=q(:); % Vectorize the matrix
tLv=tLv(:); % Vectorize the matrix
IDSL=IDSL(:); % Vectorize the matrix

%td=ts+20; % Asymptomatic increase 20 days from symptom onset

R0S=R0; % Set R0 for symptomatic
R0A=R0; % Set R0 for asymptomatic

parfor jj=1:63
    % Assumes asymptomatic enter over infections period [0,ts+21]
        IDSL(jj)=(1-pA).*((1./ts).*integral2(@(u,t)InfectiousnessfromInfectionTestingEntry(t,u+q(jj)-1,R0S,R0A,0,ts,td,tLv(jj),SelfIsolate),0,ts,@(u)(u+q(jj)),inf))+pA.*((1./td).*integral2(@(u,t)InfectiousnessfromInfectionTestingEntry(t,u+q(jj)-1,R0S,R0A,1,ts,td,tLv(jj),0),0,td,@(u)(u+q(jj)),inf));  
end
save('TestingonExit_pA=226_OneDayDelay.mat');
