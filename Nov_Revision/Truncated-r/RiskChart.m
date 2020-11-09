function [fig1] = RiskChart(IDSNT,IDSTE,IDSTX,IDSTEX,q,Risk)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Average probability of onward transmisison
Prob=[(Probability_Onward(IDSNT,Risk))' (Probability_Onward(IDSTE,Risk))' (Probability_Onward(IDSTX,Risk))' (Probability_Onward(IDSTEX,Risk))'];


f14=find(q==14);
ESI=IDSNT(f14);

fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n');
fprintf('Infections post-quarantine\n');
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n');

fprintf('Expected number of secondary infection 14 day quaratine with no testing: %4.3f \n', ESI)

fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n');
fprintf('Slope of no testing\n');
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n');

d1=1;
d2=4;
fprintf('Slope of no testing from duration %d to duration %d: %3.2f \n',[q(d1) q(d2) (Prob(d2,1)-Prob(d1,1))./(q(d2)-q(d1))] );


d1=4;
d2=9;
fprintf('Slope of no testing from duration %d to duration %d: %3.2f \n',[q(d1) q(d2) (Prob(d2,1)-Prob(d1,1))./(q(d2)-q(d1))] );


d1=9;
d2=15;
fprintf('Slope of no testing from duration %d to duration %d: %4.3f \n',[q(d1) q(d2) (Prob(d2,1)-Prob(d1,1))./(q(d2)-q(d1))] );

fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n');
fprintf('Probability of no testing\n');
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n');

d1=1;
d2=4;
fprintf('Slope of no testing from duration %d to duration %d: %3.2f to %3.2f \n',[q(d1) q(d2) Prob(d1,1) Prob(d2,1)] );


d1=4;
d2=9;
fprintf('Slope of no testing from duration %d to duration %d: %3.2f to %3.2f \n',[q(d1) q(d2) Prob(d1,1) Prob(d2,1)] );


d1=9;
d2=15;
fprintf('Slope of no testing from duration %d to duration %d: %3.2f to %3.2f \n',[q(d1) q(d2) Prob(d1,1) Prob(d2,1)] );

fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n');
fprintf('Minimum relative reduction of testing\n');
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n');

PRR=1-Prob(:,[2:4])./(repmat(Prob(:,1),1,3));

fprintf('Minimum reduction probability: %3.1f%% \n',[min(PRR(:))*100] );

PRR=1-[IDSTE;IDSTX;IDSTEX]./repmat(IDSNT,3,1);

fprintf('Minimum reduction secondary infections: %3.1f%% \n',[min(PRR(:))*100] );

fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n');
fprintf('Reduction in probability testing entry 0 duratino to duration 3 days\n');
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n');

d1=1;
d2=4;
fprintf('Relative reduction probability from increasing duration from %d to %d: %3.1f%% \n',[q(d1) q(d2) (1-Prob(d2,2)./Prob(d1,2)).*100] );


fig1=figure('units','normalized','outerposition',[0 0 0.5 1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate Panel B: Probability of onward transmission
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S2=subplot('Position',[0.08 0.01 0.8 0.915]);
load('ColormapProb');
RR=[0.01 0.1:0.1:1];
for ii=0:21
    for ss=0:3
        ff=find(RR>=Prob(ii+1,ss+1),1);
        patch(ss+[-0.5 0.5 0.5 -0.5],ii+[-0.5 -0.5 0.5 0.5], CCC(ff,:)); hold on
        if(round(Prob(ii+1,ss+1),3)>0)
            text(ss,ii,num2str(round(Prob(ii+1,ss+1),3)),'HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
        else
            text(ss,ii,'<0.001','HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
        end
    end
end
ylim([-0.5 21.5]);
set(gca,'LineWidth',2,'tickdir','out','XTick',[0 1 2 3],'YTick',q,'XTickLabel',{'No testing','Entry','Exit','Entry and Exit'},'Fontsize',16,'YDir','reverse','XAxisLocation','top');
box off;
xlabel('Testing strategy','Fontsize',18);
ylabel('Duration of quarantine','Fontsize',18);

caxis([-0.5 10.5])
hh=colorbar;
hh.Ticks=[0:11];
hh.TickLabels={'0 to 0.01','0.01 to 0.1','0.1 to 0.2','0.2 to 0.3','0.3 to 0.4','0.4 to 0.5','0.5 to 0.6','0.6 to 0.7','0.7 to 0.8','0.8 to 0.9','0.9 to 1.0'};
hh.Label.String={'Probability of post-quarantine transmission'};
hh.Label.Rotation=270;
hh.Label.Position=[7.25 5.5 0];
hh.Label.FontSize=18;

colormap(S2,CCC);

end

