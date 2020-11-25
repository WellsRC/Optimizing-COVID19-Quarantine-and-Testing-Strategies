clear;

pobj=parpool(20);

q=[0:21];

SelfIsolate=1; % Self-isolation
tLt=[1.9 2.9 3.9];

[qmtemp,dtmtemp]=meshgrid(q,q);
qm=qmtemp(qmtemp>=dtmtemp);
dtm=dtmtemp(qmtemp>=dtmtemp);
N=length(qm);
RT=zeros(length(tLt),length(qm));
RAT=zeros(length(tLt),length(qm));
IDSL=zeros(length(tLt),length(qm));

RT=RT(:);
RAT=RAT(:);
IDSL=IDSL(:);
IncubationI=zeros(size(RT));
PreI=zeros(size(RT));

[qmm,tLv]=meshgrid(qm,tLt);
[dtmm,~]=meshgrid(dtm,tLt);

tLv=tLv(:);
qmm=qmm(:);
dtmm=dtmm(:);


for jj=1:length(PreI)    
    [pA,IncubationI(jj),R0,ts] = BaselineParameters(tLv(jj));
    PreI(jj)=R0.*IncubationI(jj);
end

td=ts+20;

R0S=R0;
R0A=R0;
parfor jj=1:759
        IDSL(jj)=(1-pA).*((1./ts).*dblquad(@(u,t)InfectiousnessfromInfectionTestingEntry(t+u,u+dtmm(jj),R0S,R0A,0,ts,tLv(jj),SelfIsolate),0,ts,qmm(jj),inf))+pA.*((1./td).*dblquad(@(u,t)InfectiousnessfromInfectionTestingEntry(t+u,u+dtmm(jj),R0S,R0A,1,ts,tLv(jj),0),0,td,qmm(jj),inf));  
        RT(jj)=dblquad(@(u,t)(DurationInfected(u,IncubationI(jj),ts,tLv(jj)).*InfectiousnessfromInfectionTestingEntry(t+u,u+dtmm(jj),R0S,R0A,pA,ts,tLv(jj),SelfIsolate)),0,ts,qmm(jj),inf);       
        RAT(jj)=(1./quad(@(u)(InfectiousnessfromInfection(u,R0,R0,1,ts,tLv(jj),0)),ts,inf)).*dblquad(@(u,t)(InfectiousnessfromInfection(u,R0S,R0A,1,ts,tLv(jj),0).*InfectiousnessfromInfectionTestingEntry(t+u,u+dtmm(jj),R0S,R0A,1,ts,tLv(jj),0)),ts,inf,qmm(jj),inf);       
end

RTot=(PreI.*RT+pA.*R0.*RAT)./(PreI+pA.*R0);

save('TestingonDayt_21DayQ.mat');

