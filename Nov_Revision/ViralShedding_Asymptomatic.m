function V = ViralShedding_Asymptomatic(t,tL)
%ViralShedding_Asymptomatic(t,tL) reutrns the level of infectiousness for an asymptomatic individual at
%time t

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% t - time post-infection
%tL- duration of the latent period

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% V - the amount of viral shedding at time t

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% See EstimatingInfectioncurves for how determined

av=[6.85146800000000;3.44342380000000;2.16082760000000];
bv=[0.982316341225263;1.76955383531329;2.35323186981921];
dtv=[0.606;0.499;0.232];
mv=[8.63788563715968,4.33152485926992,4.57861963500893];

LatentPeriod=[1.9,2.9,3.9];
a=av(tL==LatentPeriod);
b=bv(tL==LatentPeriod);
dt=dtv(tL==LatentPeriod);
m=mv(tL==LatentPeriod);

V=zeros(size(t));
V(t>=(tL+dt))=gampdf(t(t>=(tL+dt))-tL,a,b); % Do not need the 100 as the 100 was used to scale to the data y and this will be normalzied after

CD=gampdf(dt,a,b);
A=CD./(exp(m.*(dt+tL))-1);
V(t<(tL+dt))=A.*(exp(m.*t(t<(tL+dt)))-1);

% Normalizing constant
NC=integral(@(x)(A.*(exp(m.*x)-1)),0,tL+dt)+integral(@(x)(gampdf(x-tL,a,b)),tL+dt,inf);

V=V./NC;
end

