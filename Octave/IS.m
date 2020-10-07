% Produces the daily infectiousness w/ no self-isolation

clear;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baseline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tsv=linspace(1,21,1001);
t=linspace(0,60,5001);
ID=zeros(length(tsv),5001);
RNS=zeros(length(tsv),1);

IDS=zeros(length(tsv),5001);
RS=zeros(length(tsv),1);

RPre=zeros(length(tsv),1);

for jj=1:length(tsv)
    ts=tsv(jj);
    [pA,IncubationI,R0] = BaselineParameters(ts);
    
    R0S=R0;
    R0A=R0;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % NO SELF-ISOLATION
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ID=zeros(101,1);
    SelfIsolate=0; % No self-isolation

    ID(jj,:)=InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate);
    RNS(jj)=quadv(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate),0,inf);

    SelfIsolate=1; % Self-isolation of symptomatics
    IDS(jj,:)=InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate);
    RS(jj)=quadv(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate),0,inf);
    
    RPre(jj)=quadv(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate),0,ts);
end

save('ImpactSelfIsolation_R0=2_5.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% R0=2; pA=0.179
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
tsv=linspace(1,21,1001);
t=linspace(0,60,5001);
ID=zeros(length(tsv),5001);
RNS=zeros(length(tsv),1);

IDS=zeros(length(tsv),5001);
RS=zeros(length(tsv),1);

RPre=zeros(length(tsv),1);

for jj=1:length(tsv)
    ts=tsv(jj);
    [pA,IncubationI,~] = BaselineParameters(ts);
    R0=2;
    R0S=R0;
    R0A=R0;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % NO SELF-ISOLATION
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ID=zeros(101,1);
    SelfIsolate=0; % No self-isolation

    ID(jj,:)=InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate);
    RNS(jj)=quadv(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate),0,inf);

    SelfIsolate=1; % Self-isolation of symptomatics
    IDS(jj,:)=InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate);
    RS(jj)=quadv(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate),0,inf);
    
    RPre(jj)=quadv(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate),0,ts);
end

save('ImpactSelfIsolation_R0=2.mat');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% R0=2.5; pA=0.226
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tsv=linspace(1,21,1001);
t=linspace(0,60,5001);
ID=zeros(length(tsv),5001);
RNS=zeros(length(tsv),1);

IDS=zeros(length(tsv),5001);
RS=zeros(length(tsv),1);

RPre=zeros(length(tsv),1);

for jj=1:length(tsv)
    ts=tsv(jj);
    [~,IncubationI,R0] = BaselineParameters(ts);
    pA=0.226;
    R0S=R0;
    R0A=R0;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % NO SELF-ISOLATION
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ID=zeros(101,1);
    SelfIsolate=0; % No self-isolation

    ID(jj,:)=InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate);
    RNS(jj)=quadv(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate),0,inf);

    SelfIsolate=1; % Self-isolation of symptomatics
    IDS(jj,:)=InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate);
    RS(jj)=quadv(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate),0,inf);
    
    RPre(jj)=quadv(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate),0,ts);
end

save('ImpactSelfIsolation_R0=2_5_pA=226.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% R0=2.0; pA=0.226
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tsv=linspace(1,21,1001);
t=linspace(0,60,5001);
ID=zeros(length(tsv),5001);
RNS=zeros(length(tsv),1);

IDS=zeros(length(tsv),5001);
RS=zeros(length(tsv),1);

RPre=zeros(length(tsv),1);

for jj=1:length(tsv)
    ts=tsv(jj);
    [~,IncubationI,~] = BaselineParameters(ts);
    R0=2;
    pA=0.226;
    R0S=R0;
    R0A=R0;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % NO SELF-ISOLATION
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ID=zeros(101,1);
    SelfIsolate=0; % No self-isolation

    ID(jj,:)=InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate);
    RNS(jj)=quadv(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate),0,inf);

    SelfIsolate=1; % Self-isolation of symptomatics
    IDS(jj,:)=InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate);
    RS(jj)=quadv(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate),0,inf);
    
    RPre(jj)=quadv(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate),0,ts);
end

save('ImpactSelfIsolation_R0=2_pA=226.mat');