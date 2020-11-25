% Conducts the analysis for contact tracing with no testing
clear;

pobj=parpool(20); % parallel pool open
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baseline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
qt=[0:21]; % Quarantine durations consideredd

SelfIsolate=1; % Self-isolation
tLt=[1.9 2.9 3.9]; % vecotor for the latent periods for the scenario analysis

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
        PreI(ii)=R0.*IncubationI(ii); % Need to scale by R0 as it only returns the proportion of infections during incubation period
end
td=ts+20; % Asymptomatic increase 21 days from symptom onset

R0S=R0; % Set R0 for symptomatic
R0A=R0; % Set R0 for asymptomatic

d1=1;% the delya in identifying the contacts

parfor jj=1:66
        % Computation for symptomatic and asymptomatic infected by index
        R(jj)=dblquad(@(u,t)(DurationInfected(u,IncubationI(jj),ts,tLv(jj)).*InfectiousnessfromInfection(t+u,R0S,R0A,pA,ts,tLv(jj),SelfIsolate)),0,ts,(q(jj)),inf);       
        RD1(jj)=dblquad(@(u,t)(DurationInfected(u,IncubationI(jj),ts,tLv(jj)).*InfectiousnessfromInfection(t+u,R0S,R0A,pA,ts,tLv(jj),SelfIsolate)),0,ts,(q(jj)+d1),inf); 
        
        % Computation for asymptomatic that infected the index case
        % ONLY ASYMPTOMATIC (SET SELF-ISOLATION TO ZER0 TO ENSURE)
        RA(jj)=(1./quad(@(u)(InfectiousnessfromInfection(u,R0,R0,1,ts,tLv(jj),0)),ts,inf)).*dblquad(@(u,t)(InfectiousnessfromInfection(u,R0S,R0A,1,ts,tLv(jj),0).*InfectiousnessfromInfection(t+u,R0S,R0A,1,ts,tLv(jj),0)),ts,inf,q(jj),inf);       
        RAD1(jj)=(1./quad(@(u)(InfectiousnessfromInfection(u,R0,R0,1,ts,tLv(jj),0)),ts+d1,inf)).*dblquad(@(u,t)(InfectiousnessfromInfection(u,R0S,R0A,1,ts,tLv(jj),0).*InfectiousnessfromInfection(t+u,R0S,R0A,1,ts,tLv(jj),0)),ts+d1,inf,q(jj),inf);
end

% Compute the total number of secondary infections
RTot=(PreI.*R+pA.*R0.*RA)./(PreI+pA.*R0);
RTotD1=(PreI.*RD1+pA.*R0.*RAD1)./(PreI+pA.*R0);

save('ContactTracing_IndexInfect_Contact.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Less  Asymptomatic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
qt=[0:21]; % Quarantine durations consideredd

SelfIsolate=1; % Self-isolation
tLt=[1.9 2.9 3.9]; % vecotor for the latent periods for the scenario analysis

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
        PreI(ii)=R0.*IncubationI(ii); % Need to scale by R0 as it only returns the proportion of infections during incubation period
end
td=ts+20; % Asymptomatic increase 21 days from symptom onset
pA=0.226;% Decrease the proportion of asymptomatic infections

R0S=R0; % Set R0 for symptomatic
R0A=R0; % Set R0 for asymptomatic

d1=1;% the delya in identifying the contacts

parfor jj=1:66
        % Computation for symptomatic and asymptomatic infected by index
        R(jj)=dblquad(@(u,t)(DurationInfected(u,IncubationI(jj),ts,tLv(jj)).*InfectiousnessfromInfection(t+u,R0S,R0A,pA,ts,tLv(jj),SelfIsolate)),0,ts,(q(jj)),inf);       
        RD1(jj)=dblquad(@(u,t)(DurationInfected(u,IncubationI(jj),ts,tLv(jj)).*InfectiousnessfromInfection(t+u,R0S,R0A,pA,ts,tLv(jj),SelfIsolate)),0,ts,(q(jj)+d1),inf); 
        
        % Computation for asymptomatic that infected the index case
        % ONLY ASYMPTOMATIC (SET SELF-ISOLATION TO ZER0 TO ENSURE)
        RA(jj)=(1./quad(@(u)(InfectiousnessfromInfection(u,R0,R0,1,ts,tLv(jj),0)),ts,inf)).*dblquad(@(u,t)(InfectiousnessfromInfection(u,R0S,R0A,1,ts,tLv(jj),0).*InfectiousnessfromInfection(t+u,R0S,R0A,1,ts,tLv(jj),0)),ts,inf,q(jj),inf);       
        RAD1(jj)=(1./quad(@(u)(InfectiousnessfromInfection(u,R0,R0,1,ts,tLv(jj),0)),ts+d1,inf)).*dblquad(@(u,t)(InfectiousnessfromInfection(u,R0S,R0A,1,ts,tLv(jj),0).*InfectiousnessfromInfection(t+u,R0S,R0A,1,ts,tLv(jj),0)),ts+d1,inf,q(jj),inf); 
end

% Compute the total number of secondary infections
RTot=(PreI.*R+pA.*R0.*RA)./(PreI+pA.*R0);
RTotD1=(PreI.*RD1+pA.*R0.*RAD1)./(PreI+pA.*R0);

save('ContactTracing_IndexInfect_Contact_pA=226.mat');
