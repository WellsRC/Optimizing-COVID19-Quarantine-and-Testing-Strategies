function R = InfectiousnessfromInfection(t,R0S,R0A,pA,ts,SelfIsolate)
%InfectiousnessfromInfection returns the infectiousness at time t given total virus
%shed and R0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% t - time post-infection
% tvsS - total virus shed symptomatic
% tvsA - total virus shed asypmptomatic
% R0S - Reproductive number symptomatic
% R0A - Reproductive number asymptomatic
% pA - proportion asymptomatic
% ts - time from infection to symptom onset (i.e. incubation period)
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
RA=R0A.*ViralShedding_Asymptomatic(t,ts);

% Computation for symptomatic
if(SelfIsolate==0)
    RS=R0S.*ViralShedding_Symptomatic(t,ts);
else
    RS=zeros(size(t));
    RS(t<=ts)=R0S.*ViralShedding_Symptomatic(t(t<=ts),ts);
end

%Combine asymptmatic and symptomaic 
R=(1-pA).*RS+pA.*RA;
end

