% Random entry in qiaratine and testing various days
clear;

% pobj=parpool(20); % Parallel pool
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baseline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
qt=[0:21]; % Quarantine durations consideredd
DayERI=[0:28]; % Day enter quarantine relative to infection
SelfIsolate=1; % Self-isolation
tL=2.9; % vecotor for the incbation periods to be integrated over

% Allcoate memory for output

% Get Basline parameters
[pA,~,R0,ts] = BaselineParameters(tL); % Does not matter here what ts is fed in 

[qmtemp,dtmtemp]=meshgrid(qt,qt);
qm=qmtemp(qmtemp>=dtmtemp);
dtm=dtmtemp(qmtemp>=dtmtemp);

[q,DayERIv]=meshgrid(qm,DayERI);
[dayTestv,~]=meshgrid(dtm,DayERI);

dayTestv=dayTestv(:);
q=q(:); % Vectorize the matrix
DayERIv=DayERIv(:); % Vectorize the matrix



IDSL=zeros(size(q)); % Assumes asymptomatic enter over infections period [0,ts+21]

R0S=R0; % Set R0 for symptomatic
R0A=R0; % Set 

parfor jj=1:7337    
    % Assumes asymptomatic enter over infections period [0,ts+21]
         IDSL(jj)=integral(@(t)InfectiousnessfromInfectionTestingEntry(t,DayERIv(jj)+dayTestv(jj),R0S,R0A,pA,ts,tL,SelfIsolate),q(jj)+DayERIv(jj),inf);
end

save('Known_Infection_ImpactQuarantine_DayTest_Latent=2point9.mat');
