function tau = TimeInfection(t,IncubationI,ts)
%TIMEINFECTION computes the time of infection
tau=ViralShedding_Symptomatic(t,ts)./IncubationI; % Do not need to do infectiousness as the R0 will cancel out
tau(t>ts)=0;

end

