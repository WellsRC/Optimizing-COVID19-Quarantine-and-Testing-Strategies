function [pA,IncubationI,R0,ts] = BaselineParameters(tL)
%BASELINEPARAMETERS 

pA=0.308;

R0=2.5;

ts=8.29;

IncubationI=integral(@(t)ViralShedding_Symptomatic(t,tL),0,ts);
end

