function [pA,IncubationI,R0] = BaselineParameters(ts)
%BASELINEPARAMETERS 

pA=0.308;

R0=2.5;

IncubationI=quadv(@(t)ViralShedding_Symptomatic(t,ts),0,ts);
end

