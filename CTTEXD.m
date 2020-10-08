% Conducts the analysis for contact tracing and testing on entry and exit
clear;

pobj=parpool(20); % parallel pool open

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baseline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

qt=[1:21]; % Quarantine durations consideredd

SelfIsolate=1; % Self-isolation
tsvt=[1:0.1:21]; % vecotor for the incbation periods to be integrated over

[q,tsv]=meshgrid(qt,tsvt); % Create a mesh grid of the paramters being changes
q=q(:); % Vectorize the matrix
tsv=tsv(:); % Vectorize the matrix

td=tsv+20; % Asymptomatic increase 21 days from symptom onset

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Allocate memory for output
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R=zeros(length(tsvt),length(qt)); % Symptomatic no delay
RD1=zeros(length(tsvt),length(qt)); % Symptomatic w/ delay


RA=zeros(length(tsvt),length(qt)); % Asymptomatic infect index no delay
RAD1=zeros(length(tsvt),length(qt)); % Asymptomatic infect index w/ delay

R=R(:); % Vectorize the matrix
RD1=RD1(:); % Vectorize the matrix
RA=RA(:); % Vectorize the matrix
RAD1=RAD1(:); % Vectorize the matrix

PreI=zeros(length(tsv),1);
IncubationI=zeros(length(tsv),1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% get pre-infection and incubation period contributuon for hte different incubation
% period
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ii=1:length(tsv)
        [pA,IncubationI(ii),R0] = BaselineParameters(tsv(ii));
        PreI(ii)=R0.*IncubationI(ii);
end

R0S=R0; % Set R0 for symptomatic
R0A=R0; % Set R0 for asymptomatic

d1=1;% the delya in identifying the contacts

parfor jj=1:4221 
        % Computation for symptomatic and asymptomatic infected by index
        R(jj)=integral2(@(u,t)(DurationInfected(u,IncubationI(jj),tsv(jj)).*InfectiousnessfromInfectionTestingEntryExit(t+u,u,u+q(jj)-1,R0S,R0A,pA,tsv(jj),SelfIsolate)),0,tsv(jj),q(jj),inf);       
        RD1(jj)=integral2(@(u,t)(DurationInfected(u,IncubationI(jj),tsv(jj)).*InfectiousnessfromInfectionTestingEntryExit(t+u,u+d1,u+d1+q(jj)-1,R0S,R0A,pA,tsv(jj),SelfIsolate)),0,tsv(jj),q(jj)+d1,inf);
        
        % Computation for asymptomatic that infected the index case
        % ONLY ASYMPTOMATIC (SET SELF-ISOLATION TO ZER0 TO ENSURE)
        RA(jj)=(1./integral(@(u)(InfectiousnessfromInfection(u,R0,R0,1,tsv(jj),0)),tsv(jj),inf)).*integral2(@(u,t)(InfectiousnessfromInfection(u,R0S,R0A,1,tsv(jj),0).*InfectiousnessfromInfectionTestingEntryExit(t+u,u,u+q(jj)-1,R0S,R0A,1,tsv(jj),0)),0,td(jj),tsv(jj)+q(jj),inf);       
        RAD1(jj)=(1./integral(@(u)(InfectiousnessfromInfection(u,R0,R0,1,tsv(jj),0)),tsv(jj)+d1,inf)).*integral2(@(u,t)(InfectiousnessfromInfection(u,R0S,R0A,1,tsv(jj),0).*InfectiousnessfromInfectionTestingEntryExit(t+u,u+d1,u+d1+q(jj)-1,R0S,R0A,1,tsv(jj),0)),0,td(jj),tsv(jj)+q(jj)+d1,inf);
end

% Compute the total number of secondary infections
RTot=(PreI.*R+pA.*R0.*RA)./(PreI+pA.*R0);
RTotD1=(PreI.*RD1+pA.*R0.*RAD1)./(PreI+pA.*R0);

save('ContactTracing_IndexInfect_Contact_Test_Entry_and_Exit_OneDayDelay.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% More Asymptomatic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

qt=[1:21]; % Quarantine durations consideredd

SelfIsolate=1; % Self-isolation
tsvt=[1:0.1:21]; % vecotor for the incbation periods to be integrated over

[q,tsv]=meshgrid(qt,tsvt); % Create a mesh grid of the paramters being changes
q=q(:); % Vectorize the matrix
tsv=tsv(:); % Vectorize the matrix

td=tsv+20; % Asymptomatic increase 21 days from symptom onset

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Allocate memory for output
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R=zeros(length(tsvt),length(qt)); % Symptomatic no delay
RD1=zeros(length(tsvt),length(qt)); % Symptomatic w/ delay


RA=zeros(length(tsvt),length(qt)); % Asymptomatic infect index no delay
RAD1=zeros(length(tsvt),length(qt)); % Asymptomatic infect index w/ delay

R=R(:); % Vectorize the matrix
RD1=RD1(:); % Vectorize the matrix
RA=RA(:); % Vectorize the matrix
RAD1=RAD1(:); % Vectorize the matrix

PreI=zeros(length(tsv),1);
IncubationI=zeros(length(tsv),1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% get pre-infection and incubation period contributuon for hte different incubation
% period
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ii=1:length(tsv)
        [~,IncubationI(ii),R0] = BaselineParameters(tsv(ii));
        PreI(ii)=R0.*IncubationI(ii);
end

pA=0.226;% Increase the proportion of asymptomatic infections

R0S=R0; % Set R0 for symptomatic
R0A=R0; % Set R0 for asymptomatic

d1=1;% the delya in identifying the contacts

parfor jj=1:4221 
        % Computation for symptomatic and asymptomatic infected by index
        R(jj)=integral2(@(u,t)(DurationInfected(u,IncubationI(jj),tsv(jj)).*InfectiousnessfromInfectionTestingEntryExit(t+u,u,u+q(jj)-1,R0S,R0A,pA,tsv(jj),SelfIsolate)),0,tsv(jj),q(jj),inf);       
        RD1(jj)=integral2(@(u,t)(DurationInfected(u,IncubationI(jj),tsv(jj)).*InfectiousnessfromInfectionTestingEntryExit(t+u,u+d1,u+d1+q(jj)-1,R0S,R0A,pA,tsv(jj),SelfIsolate)),0,tsv(jj),q(jj)+d1,inf);
        
        % Computation for asymptomatic that infected the index case
        % ONLY ASYMPTOMATIC (SET SELF-ISOLATION TO ZER0 TO ENSURE)
        RA(jj)=(1./integral(@(u)(InfectiousnessfromInfection(u,R0,R0,1,tsv(jj),0)),tsv(jj),inf)).*integral2(@(u,t)(InfectiousnessfromInfection(u,R0S,R0A,1,tsv(jj),0).*InfectiousnessfromInfectionTestingEntryExit(t+u,u,u+q(jj)-1,R0S,R0A,1,tsv(jj),0)),0,td(jj),tsv(jj)+q(jj),inf);       
        RAD1(jj)=(1./integral(@(u)(InfectiousnessfromInfection(u,R0,R0,1,tsv(jj),0)),tsv(jj)+d1,inf)).*integral2(@(u,t)(InfectiousnessfromInfection(u,R0S,R0A,1,tsv(jj),0).*InfectiousnessfromInfectionTestingEntryExit(t+u,u+d1,u+d1+q(jj)-1,R0S,R0A,1,tsv(jj),0)),0,td(jj),tsv(jj)+q(jj)+d1,inf);
end


% Compute the total number of secondary infections
RTot=(PreI.*R+pA.*R0.*RA)./(PreI+pA.*R0);
RTotD1=(PreI.*RD1+pA.*R0.*RAD1)./(PreI+pA.*R0);

save('ContactTracing_IndexInfect_Contact_Test_Entry_and_Exit_pA=226_OneDayDelay.mat');

