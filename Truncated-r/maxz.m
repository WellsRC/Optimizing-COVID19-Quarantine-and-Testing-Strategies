function [c,ceq] = maxz(x)
% Ensures that the sensitivity curve is monotonically decreasing over time
% such that the maximimum is obtained at zero
c=[];
tt=linspace(0,25,1001);
XX=[];
for ii=1:length(x)
    XX=[XX;tt.^(ii-1)];
end
%the non-linsear constraint that the time of the maximim is at 0 over the
%fitted range
ceq=tt(max(x*XX)==x*XX);
end

