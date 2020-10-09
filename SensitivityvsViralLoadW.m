function S = SensitivityvsViralLoadW(t,pA,ts,td)
%SensitivityvsViralLoad(V,asym) - Returns the sensitivity for a given viral
%load

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% V - Viral load in which to determine the sensitivity
% pA - proportion asymptomatic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% S - Probability of that it is a true positive based on the viral load

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Constants for hill function determined by fitting to the mont after
% symotms on set
% x=[1:30]+7.76; % points to construct the spline of the sensitivity for given viral load
% SS=[SensitivityTimeSamp(x)]; % Sensitivity over time
% VS=[ViralShedding_Symptomatic(x,7.76)]; % Assume that the sensitivitiy was measures for symptomatic individuals
% pp=fmincon(@(c)sum((SS-VS.^c(2)./(VS.^c(2)+(10.^c(1)).^c(2))).^2),[-5 1],[],[],[],[],[-16 0.01],[-2 5])


VS=ViralShedding_Symptomatic(t,ts);
VA=ViralShedding_Asymptomatic(t,ts);

if(t<=ts)
    S=(1./ts).*(1-pA).*SensitivityvsViralLoad(VS)+(1./td).*pA.*SensitivityvsViralLoad(VA);
else
    S=(1./td).*SensitivityvsViralLoad(VA);
end
end

