function tau = TimeInfection(t,IncubationI,ts,td,tL)
%TIMEINFECTION computes the time of infection

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%555
% Input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% t - time
% IncubationI - propirtion of infections during the incubation period
% tL - duration of the latent period

tau=ViralShedding_Symptomatic(t,tL,td)./IncubationI; % Do not need to do infectiousness as the R0 will cancel out
tau(t>ts)=0;

end

