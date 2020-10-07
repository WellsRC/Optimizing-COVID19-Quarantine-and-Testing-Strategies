function tau = DurationInfected(t,IncubationI,ts)
%DURATIONINFECTED Summary of this function goes here
%   Detailed explanation goes here
tau = TimeInfection(ts-t,IncubationI,ts);
end

