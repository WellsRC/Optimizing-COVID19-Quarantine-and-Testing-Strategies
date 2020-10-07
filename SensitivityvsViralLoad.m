function S = SensitivityvsViralLoad(V)
%SensitivityvsViralLoad(V,asym) - Returns the sensitivity for a given viral
%load

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% V - Viral load in which to determine the sensitivity

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

C=[3.00850731832214e-05,0.259090194626996];
S=V.^C(2)./(V.^C(2)+C(1).^C(2)); % Spline interpolation of the senisitivty given the viral load 
end

