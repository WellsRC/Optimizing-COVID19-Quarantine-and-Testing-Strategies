% Conducts the analysis for contact tracing and testing on entry
clear;

pobj=parpool(20); % parallel pool open

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baseline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
qt=[1:21]; % Quarantine durations consideredd

SelfIsolate=1; % Self-isolation
tLt=[1.9 2.9 3.9]; % vecotor for the incbation periods to be integrated over

[q,tLv]=meshgrid(qt,tLt); % Create a mesh grid of the paramters being changes
q=q(:); % Vectorize the matrix
tLv=tLv(:); % Vectorize the matrix


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Allocate memory for output
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R=zeros(length(tLt),length(qt)); % Symptomatic no delay
RD1=zeros(length(tLt),length(qt)); % Symptomatic w/ delay


RA=zeros(length(tLt),length(qt)); % Asymptomatic infect index no delay
RAD1=zeros(length(tLt),length(qt)); % Asymptomatic infect index w/ delay

R=R(:); % Vectorize the matrix
RD1=RD1(:); % Vectorize the matrix
RA=RA(:); % Vectorize the matrix
RAD1=RAD1(:); % Vectorize the matrix

PreI=zeros(length(tLv),1);
IncubationI=zeros(length(tLv),1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% get pre-infection and incubation period contributuon for hte different incubation
% period
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ii=1:length(tLv)
        [pA,IncubationI(ii),R0,ts] = BaselineParameters(tLv(ii));
        PreI(ii)=R0.*IncubationI(ii);
end

td=ts+20; % Asymptomatic increase 21 days from symptom onset

R0S=R0; % Set R0 for symptomatic
R0A=R0; % Set R0 for asymptomatic

d1=1;% the delya in identifying the contacts

parfor jj=1:63
        % Computation for symptomatic and asymptomatic infected by index
        R(jj)=integral2(@(u,t)(DurationInfected(u,IncubationI(jj),ts,tLv(jj)).*InfectiousnessfromInfectionTestingEntry(t+u,u+q(jj)-1,R0S,R0A,pA,ts,tLv(jj),SelfIsolate)),0,ts,q(jj),inf);       
        RD1(jj)=integral2(@(u,t)(DurationInfected(u,IncubationI(jj),ts,tLv(jj)).*InfectiousnessfromInfectionTestingEntry(t+u,u+q(jj)-1+d1,R0S,R0A,pA,ts,tLv(jj),SelfIsolate)),0,ts,q(jj)+d1,inf);
        
        % Computation for asymptomatic that infected the index case        
        % ONLY ASYMPTOMATIC (SET SELF-ISOLATION TO ZER0 TO ENSURE)
        RA(jj)=(1./integral(@(u)(InfectiousnessfromInfection(u,R0,R0,1,ts,tLv(jj),0)),ts,inf)).*integral2(@(u,t)(InfectiousnessfromInfection(u,R0S,R0A,1,ts,tLv(jj),0).*InfectiousnessfromInfectionTestingEntry(t+u,u+q(jj)-1,R0S,R0A,1,ts,tLv(jj),0)),ts,inf,q(jj),inf);       
        RAD1(jj)=(1./integral(@(u)(InfectiousnessfromInfection(u,R0,R0,1,ts,tLv(jj),0)),ts+d1,inf)).*integral2(@(u,t)(InfectiousnessfromInfection(u,R0S,R0A,1,ts,tLv(jj),0).*InfectiousnessfromInfectionTestingEntry(t+u,u+q(jj)-1,R0S,R0A,1,ts,tLv(jj),0)),ts+d1,inf,q(jj),inf);            
end

% Compute the total number of secondary infections
RTot=(PreI.*R+pA.*R0.*RA)./(PreI+pA.*R0);
RTotD1=(PreI.*RD1+pA.*R0.*RAD1)./(PreI+pA.*R0);

save('ContactTracing_IndexInfect_Contact_Test_Exit_Delay.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Less  Asymptomatic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
qt=[1:21]; % Quarantine durations consideredd

SelfIsolate=1; % Self-isolation
tLt=[1.9 2.9 3.9]; % vecotor for the incbation periods to be integrated over

[q,tLv]=meshgrid(qt,tLt); % Create a mesh grid of the paramters being changes
q=q(:); % Vectorize the matrix
tLv=tLv(:); % Vectorize the matrix


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Allocate memory for output
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R=zeros(length(tLt),length(qt)); % Symptomatic no delay
RD1=zeros(length(tLt),length(qt)); % Symptomatic w/ delay


RA=zeros(length(tLt),length(qt)); % Asymptomatic infect index no delay
RAD1=zeros(length(tLt),length(qt)); % Asymptomatic infect index w/ delay

R=R(:); % Vectorize the matrix
RD1=RD1(:); % Vectorize the matrix
RA=RA(:); % Vectorize the matrix
RAD1=RAD1(:); % Vectorize the matrix

PreI=zeros(length(tLv),1);
IncubationI=zeros(length(tLv),1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% get pre-infection and incubation period contributuon for hte different incubation
% period
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ii=1:length(tLv)
        [~,IncubationI(ii),R0,ts] = BaselineParameters(tLv(ii));
        PreI(ii)=R0.*IncubationI(ii);
end
pA=0.226; % reduce the number of asymptomatics
td=ts+20; % Asymptomatic increase 21 days from symptom onset

R0S=R0; % Set R0 for symptomatic
R0A=R0; % Set R0 for asymptomatic

d1=1;% the delya in identifying the contacts

parfor jj=1:63
        % Computation for symptomatic and asymptomatic infected by index
        R(jj)=integral2(@(u,t)(DurationInfected(u,IncubationI(jj),ts,tLv(jj)).*InfectiousnessfromInfectionTestingEntry(t+u,u+q(jj)-1,R0S,R0A,pA,ts,tLv(jj),SelfIsolate)),0,ts,q(jj),inf);       
        RD1(jj)=integral2(@(u,t)(DurationInfected(u,IncubationI(jj),ts,tLv(jj)).*InfectiousnessfromInfectionTestingEntry(t+u,u+q(jj)-1+d1,R0S,R0A,pA,ts,tLv(jj),SelfIsolate)),0,ts,q(jj)+d1,inf);
        
        % Computation for asymptomatic that infected the index case        
        % ONLY ASYMPTOMATIC (SET SELF-ISOLATION TO ZER0 TO ENSURE)
        RA(jj)=(1./integral(@(u)(InfectiousnessfromInfection(u,R0,R0,1,ts,tLv(jj),0)),ts,inf)).*integral2(@(u,t)(InfectiousnessfromInfection(u,R0S,R0A,1,ts,tLv(jj),0).*InfectiousnessfromInfectionTestingEntry(t+u,u+q(jj)-1,R0S,R0A,1,ts,tLv(jj),0)),ts,inf,q(jj),inf);       
        RAD1(jj)=(1./integral(@(u)(InfectiousnessfromInfection(u,R0,R0,1,ts,tLv(jj),0)),ts+d1,inf)).*integral2(@(u,t)(InfectiousnessfromInfection(u,R0S,R0A,1,ts,tLv(jj),0).*InfectiousnessfromInfectionTestingEntry(t+u,u+q(jj)-1,R0S,R0A,1,ts,tLv(jj),0)),ts+d1,inf,q(jj),inf);            
end

% Compute the total number of secondary infections
RTot=(PreI.*R+pA.*R0.*RA)./(PreI+pA.*R0);
RTotD1=(PreI.*RD1+pA.*R0.*RAD1)./(PreI+pA.*R0);


save('ContactTracing_IndexInfect_Contact_Test_Exit_Delay_pA=226.mat');
