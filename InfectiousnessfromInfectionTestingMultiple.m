function R = InfectiousnessfromInfectionTestingMultiple(t,u,testd,R0S,R0A,pA,ts,SelfIsolate)
%InfectiousnessfromInfection returns the infectiousness at time t given total virus
%shed and R0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% t - time post-infection
% u - time of testing
% testd- the days the testing is contducted
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
SA=zeros(length(testd),length(u));
for ii=1:length(testd)
    SA(ii,:) = SensitivityvsViralLoad(ViralShedding_Asymptomatic(u+testd(ii),ts)).*ones(size(t));
    SA(ii,t-u<0)=0; % Should not occur as we feed in t+u but have condition just in case
end
% Computation for symptomatic
if(SelfIsolate==0)
    RS=R0S.*ViralShedding_Symptomatic(t,ts);
else
    RS=zeros(size(t));
    RS(t<=ts)=R0S.*ViralShedding_Symptomatic(t(t<=ts),ts);
end

SS=zeros(length(testd),length(u));
for ii=1:length(testd) 
    SS(ii,:) = SensitivityvsViralLoad(ViralShedding_Symptomatic(u+testd(ii),ts)).*ones(size(t));
    SS(ii,t-u<0)=0; % Should not occur as we feed in t+u but have condition just in case
end
%Combine asymptmatic and symptomaic 
R=(1-pA).*RS.*prod((1-SS),1)+pA.*RA.*prod((1-SA),1);
end

