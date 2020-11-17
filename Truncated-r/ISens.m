% Produces the daily infectiousness w/ no self-isolation

clear;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Baseline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tsv=linspace(1,21,1001);
t=[0 4];
SS=zeros(length(tsv),2);
SS2=zeros(length(tsv),2);

RPre=zeros(length(tsv),1);

for jj=1:length(tsv)
    ts=tsv(jj);
    [pA,IncubationI,R0] = BaselineParameters(ts);
    
    td=ts+20;
    R0S=R0;
    R0A=R0;
    for tt=1:2
        SS2(jj,tt)=integral(@(u)SensitivityvsViralLoadW(u+t(tt),pA,ts,td),0,td);
    end
end

save('Sensirivity_Time_Quarantine.mat');