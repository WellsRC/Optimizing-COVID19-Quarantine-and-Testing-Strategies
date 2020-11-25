function R = InfectiousnessfromInfectionTestingEntryExit(t,u,ux,R0S,R0A,pA,ts,tL,SelfIsolate)
%InfectiousnessfromInfection returns the infectiousness at time t given total virus
%shed and R0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% t - time post-infection
% u - time of testing
% R0S - Reproductive number symptomatic
% R0A - Reproductive number asymptomatic
% pA - proportion asymptomatic
% ts - time from infection to symptom onset (i.e. incubation period)
% tL - Duration of the latent period
% SelfIsolate - 0 no self-isolation of symptomatic otherwise self-isolation
% upon symptom onset
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% S - Probability of that it is a true positive based on the viral load

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Computation for asymptomatic
RA=R0A.*ViralShedding_Asymptomatic(t,tL);
SA = SensitivityvsViralLoad(ViralShedding_Asymptomatic(u,tL),ts,tL).*ones(size(t));
%SA(t-u<0)=0; % Should not occur as we feed in t+u but have condition just in case
SAx = SensitivityvsViralLoad(ViralShedding_Asymptomatic(ux,tL),ts,tL).*ones(size(t));
%SAx(t-ux<0)=0; % Should not occur as we feed in t+u but have condition just in case
% Computation for symptomatic
if(SelfIsolate==0)
    RS=R0S.*ViralShedding_Symptomatic(t,tL);
else
    RS=zeros(size(t));
    RS(t<=ts)=R0S.*ViralShedding_Symptomatic(t(t<=ts),tL);
end
SS = SensitivityvsViralLoad(ViralShedding_Symptomatic(u,tL),ts,tL).*ones(size(t));
%SS(t-u<0)=0; % Should not occur as we feed in t+u but have condition just in case
SSx = SensitivityvsViralLoad(ViralShedding_Symptomatic(ux,tL),ts,tL).*ones(size(t));
%SSx(t-ux<0)=0; % Should not occur as we feed in t+u but have condition just in case
%Combine asymptmatic and symptomaic 
R=(1-pA).*RS.*(1-SS).*(1-SSx)+pA.*RA.*(1-SA).*(1-SAx);
end

