function tau = DurationInfected(t,IncubationI,ts,td,tL)
%DURATIONINFECTED returns the distbution of how long they have been
%infected

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%555
% Input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% t - time
% IncubationI - AUC of r(t) during the incubation period
% tL - duration of the latent period

tau = TimeInfection(ts-t,IncubationI,ts,td,tL);
end

