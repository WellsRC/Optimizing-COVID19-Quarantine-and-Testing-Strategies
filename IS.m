% Produces the daily infectiousness w/ no self-isolation

clear;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baseline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tLv=[1.9 2.9 3.9];
t=linspace(0,60,5001);
ID=zeros(length(tLv),5001);
RNS=zeros(length(tLv),1);

IDS=zeros(length(tLv),5001);
RS=zeros(length(tLv),1);

RPre=zeros(length(tLv),1);

for jj=1:length(tLv)
    [pA,IncubationI,R0,ts] = BaselineParameters(tLv(jj));
    
    R0S=R0;
    R0A=R0;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % NO SELF-ISOLATION
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ID=zeros(101,1);
    SelfIsolate=0; % No self-isolation

    ID(jj,:)=InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate);
    RNS(jj)=integral(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate),0,inf);

    SelfIsolate=1; % Self-isolation of symptomatics
    IDS(jj,:)=InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate);
    RS(jj)=integral(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate),0,inf);
    
    RPre(jj)=integral(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate),0,ts);
end

save('ImpactSelfIsolation_R0=2_5.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% R0=2; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
tLv=[1.9 2.9 3.9];
t=linspace(0,60,5001);
ID=zeros(length(tLv),5001);
RNS=zeros(length(tLv),1);

IDS=zeros(length(tLv),5001);
RS=zeros(length(tLv),1);

RPre=zeros(length(tLv),1);

for jj=1:length(tLv)
    [pA,IncubationI,~,ts] = BaselineParameters(tLv(jj));
    R0=2;
    R0S=R0;
    R0A=R0;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % NO SELF-ISOLATION
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ID=zeros(101,1);
    SelfIsolate=0; % No self-isolation

    ID(jj,:)=InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate);
    RNS(jj)=integral(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate),0,inf);

    SelfIsolate=1; % Self-isolation of symptomatics
    IDS(jj,:)=InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate);
    RS(jj)=integral(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate),0,inf);
    
    RPre(jj)=integral(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate),0,ts);
end

save('ImpactSelfIsolation_R0=2.mat');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% R0=2.5; pA=0.226
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tLv=[1.9 2.9 3.9];
t=linspace(0,60,5001);
ID=zeros(length(tLv),5001);
RNS=zeros(length(tLv),1);

IDS=zeros(length(tLv),5001);
RS=zeros(length(tLv),1);

RPre=zeros(length(tLv),1);

for jj=1:length(tLv)
    [~,IncubationI,R0,ts] = BaselineParameters(tLv(jj));
    pA=0.226;
    R0S=R0;
    R0A=R0;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % NO SELF-ISOLATION
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ID=zeros(101,1);
    SelfIsolate=0; % No self-isolation

    ID(jj,:)=InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate);
    RNS(jj)=integral(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate),0,inf);

    SelfIsolate=1; % Self-isolation of symptomatics
    IDS(jj,:)=InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate);
    RS(jj)=integral(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate),0,inf);
    
    RPre(jj)=integral(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate),0,ts);
end

save('ImpactSelfIsolation_R0=2_5_pA=226.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% R0=2.0; pA=0.226
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tLv=[1.9 2.9 3.9];
t=linspace(0,60,5001);
ID=zeros(length(tLv),5001);
RNS=zeros(length(tLv),1);

IDS=zeros(length(tLv),5001);
RS=zeros(length(tLv),1);

RPre=zeros(length(tLv),1);

for jj=1:length(tLv)
    [~,IncubationI,~,ts] = BaselineParameters(tLv(jj));
    pA=0.226;
    R0=2;
    
    R0S=R0;
    R0A=R0;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % NO SELF-ISOLATION
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ID=zeros(101,1);
    SelfIsolate=0; % No self-isolation

    ID(jj,:)=InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate);
    RNS(jj)=integral(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate),0,inf);

    SelfIsolate=1; % Self-isolation of symptomatics
    IDS(jj,:)=InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate);
    RS(jj)=integral(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate),0,inf);
    
    RPre(jj)=integral(@(t)InfectiousnessfromInfection(t,R0S,R0A,pA,ts,tLv(jj),SelfIsolate),0,ts);
end

save('ImpactSelfIsolation_R0=2_pA=226.mat');