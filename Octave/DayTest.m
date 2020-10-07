clear;

%pobj=parpool(20);

q=[0:21];

SelfIsolate=1; % Self-isolation
tsvt=[1:0.1:21];

[qmtemp,dtmtemp]=meshgrid(q,q);
qm=qmtemp(qmtemp>=dtmtemp);
dtm=dtmtemp(qmtemp>=dtmtemp);
N=length(qm);
RT=zeros(length(tsvt),length(qm));
RAT=zeros(length(tsvt),length(qm));
IDSL=zeros(length(tsvt),length(qm));

RT=RT(:);
RAT=RAT(:);
IDSL=IDSL(:);
IncubationI=zeros(size(RT));
PreI=zeros(size(RT));

[qmm,tsv]=meshgrid(qm,tsvt);
[dtmm,~]=meshgrid(dtm,tsvt);

tsv=tsv(:);
qmm=qmm(:);
dtmm=dtmm(:);

td=tsv+20;

for jj=1:length(PreI)    
    [pA,IncubationI(jj),R0] = BaselineParameters(tsv(jj));
    PreI(jj)=R0.*IncubationI(jj);
end

R0S=R0;
R0A=R0;
for jj=1:50853
        IDSL(jj)=(1-pA).*((1./tsv(jj)).*dblquad(@(u,t)InfectiousnessfromInfectionTestingEntry(t,u+dtmm(jj),R0S,R0A,0,tsv(jj),SelfIsolate),0,tsv(jj),@(u)(u+qmm(jj)),inf,'RelTol',1e-8,'AbsTol',1e-13))+pA.*((1./td(jj)).*dblquad(@(u,t)InfectiousnessfromInfectionTestingEntry(t,u+dtmm(jj),R0S,R0A,1,tsv(jj),0),0,td(jj),@(u)(u+qmm(jj)),inf,'RelTol',1e-8,'AbsTol',1e-13));  
        RT(jj)=dblquad(@(u,t)(DurationInfected(u,IncubationI(jj),tsv(jj)).*InfectiousnessfromInfectionTestingEntry(t+u,u+dtmm(jj),R0S,R0A,pA,tsv(jj),SelfIsolate)),0,tsv(jj),qmm(jj),inf,'RelTol',1e-8,'AbsTol',1e-13);       
        RAT(jj)=(1./quadv(@(u)(InfectiousnessfromInfection(u,R0,R0,1,tsv(jj),0)),tsv(jj),inf)).*dblquad(@(u,t)(InfectiousnessfromInfection(u,R0S,R0A,1,tsv(jj),0).*InfectiousnessfromInfectionTestingEntry(t+u,u+dtmm(jj),R0S,R0A,1,tsv(jj),0)),0,td(jj),qmm(jj),inf,'RelTol',1e-8,'AbsTol',1e-13);       
end

RTot=(PreI.*RT+pA.*R0.*RAT)./(PreI+pA.*R0);

save('TestingonDayt_21DayQ.mat');

