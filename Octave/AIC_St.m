% Computes the functions for the sensitivity curve
clear;
% Data from Clinical sensitivity and interpretation of PCR and serological COVID-19 diagnostics for patients presenting to the hospital
xt=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25];
y=[0.926573426573427,0.956293706293706,0.940559440559441,0.965034965034965,0.945804195804196,0.902097902097902,0.840909090909091,0.818181818181818,0.756993006993007,0.713286713286713,0.697552447552448,0.706293706293706,0.646853146853147,0.632867132867133,0.620629370629371,0.590909090909091,0.555944055944056,0.543706293706294,0.496503496503496,0.423076923076923,0.381118881118881,0.304195804195804,0.258741258741259,0.213286713286713,0.199300699300699,0.169580419580420];

% Transform to logit
p=log(y./(1-y));

% Set up the computation
beta=cell(12,1);
AIC=zeros(12,1);
mm=zeros(12,1);
fval=zeros(12,1);
n=length(xt);
X=[];
for ii=0:11    
    % Note: Not shifting by tS here so need to account for the shift in the
    % function when implementing
    X=[X;xt.^ii]; 
    test=polyfit(xt,p,ii);
    if(ii<1)
        test2=fmincon(@(z)(sum((z*X-p).^2)),[1]);
    else
        c=[2:ii];
        test2=fmincon(@(z)(sum((z*X-p).^2)),[test2 0],[],[],[],[],[],[],@maxz);
    end
    beta{ii+1}=test2;
    fval(ii+1)=sum((polyval(flip(test2),xt)-p).^2);
    k=ii+1;
    AIC(ii+1)=2*k+n*log(fval(ii+1));
    
end

dAIC=AIC-min(AIC);

% Output the AIC selected model
polyc=[beta{dAIC==0}]

%Note: need to flip based on how the coefifciented were estimated and how polyval
%works
