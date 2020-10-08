% Produces the daily infectiousness w/ no self-isolation

clear;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baseline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tsv=linspace(1,21,1001);
t=[0 4];
SS=zeros(length(tsv),2);

RPre=zeros(length(tsv),1);

for jj=1:length(tsv)
    ts=tsv(jj);
    [pA,IncubationI,R0] = BaselineParameters(ts);
    
    td=ts+20;
    R0S=R0;
    R0A=R0;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % NO SELF-ISOLATION
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ID=zeros(101,1);
    SelfIsolate=0; % No self-isolation
    for tt=1:2
        SS(jj,tt)=(1-pA).*(1./ts).*integral(@(u)(SensitivityvsViralLoad(ViralShedding_Symptomatic(u+t(tt),ts))),0,ts)+pA.*(1./td).*integral(@(u)(SensitivityvsViralLoad(ViralShedding_Symptomatic(u+t(tt),ts))),0,td);
    end
end

save('Sensirivity_Time_Quarantine.mat');