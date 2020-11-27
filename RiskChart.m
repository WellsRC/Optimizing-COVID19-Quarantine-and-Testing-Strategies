function [fig1] = RiskChart(IDSNT,IDSTE,IDSTX,IDSTEX,q,Risk)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Average probability of onward transmisison
Prob=[(Probability_Onward(IDSNT,Risk))' (Probability_Onward(IDSTE,Risk))' (Probability_Onward(IDSTX,Risk))' (Probability_Onward(IDSTEX,Risk))'];


% Vectors for the duration of quarantine equivialent to no testing
No_Testing=q';
Test_Entry=zeros(size(No_Testing));
Test_Exit=zeros(size(No_Testing));
Test_Entry_Exit=zeros(size(No_Testing));

for ii=1:length(q)
    % Expected number of secodnary infections post quaratnine NO TESTING
    ESI=round(Prob(ii,1),3);
    md=find(round(Prob(:,2),3)<=ESI,1); % Find the equivilent or better with testing on entry (i.e. fewer expected cases)
    Test_Entry(ii)=q(md); % Record duration of quarantine
     
    md=find(round(Prob(:,3),3)<=ESI,1);% Find the equivilent or better with testing on exit (i.e. fewer expected cases)
    Test_Exit(ii)=q(md); % Record duration of quarantine
    
    md=find(round(Prob(:,4),3)<=ESI,1); % Find the equivilent or better with testing on entry and exit (i.e. fewer expected cases)
    Test_Entry_Exit(ii)=q(md); % Record duration of quarantine
end


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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate Figure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig1=figure('units','normalized','outerposition',[0 0 0.65 1]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate Panel A: Prob PQT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S1=subplot('Position',[0.0575 0.01 0.38 0.915]);
load('ColormapProb');
RR=[0.01 0.1:0.1:1];
for ii=0:21
    for ss=0:3
        ff=find(RR>=round(Prob(ii+1,ss+1),3),1);
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

xlim([-0.5 3.5]);
caxis([-0.5 10.5])
hh=colorbar;
hh.Ticks=[0:11];
hh.TickLabels={'0 to 0.01','0.01 to 0.1','0.1 to 0.2','0.2 to 0.3','0.3 to 0.4','0.4 to 0.5','0.5 to 0.6','0.6 to 0.7','0.7 to 0.8','0.8 to 0.9','0.9 to 1.0'};
hh.Label.String={'Probability of post-quarantine transmission'};
hh.Label.Rotation=270;
hh.Label.Position=[7.25 5.5 0];
hh.Label.FontSize=18;

colormap(S1,CCC);


text(-1.08,-1.91,'A','Fontsize',32,'FontWeight','bold');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate Panel B: Equiv strategies
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S2=subplot('Position',[0.5825 0.01 0.38 0.915]);

load('CCTest.mat');

for ii=0:21
    % Testing on entry
    ss=1;
    patch(ss+[-0.5 0.5 0.5 -0.5],ii+[-0.5 -0.5 0.5 0.5], cc(Test_Entry(ii+1)+1,:)); hold on
    text(ss,ii,num2str(Test_Entry(ii+1)),'HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    % Testing on exit
    ss=2;
    patch(ss+[-0.5 0.5 0.5 -0.5],ii+[-0.5 -0.5 0.5 0.5], cc(Test_Exit(ii+1)+1,:)); hold on
    text(ss,ii,num2str(Test_Exit(ii+1)),'HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    % Testing on entry and exit
    ss=3;
    patch(ss+[-0.5 0.5 0.5 -0.5],ii+[-0.5 -0.5 0.5 0.5], cc(Test_Entry_Exit(ii+1)+1,:)); hold on
    text(ss,ii,num2str(Test_Entry_Exit(ii+1)),'HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
end
ylim([-0.5 21.5]);
xlim([0.5 3.5]);
set(gca,'LineWidth',2,'tickdir','out','XTick',[1 2 3],'YTick',q,'XTickLabel',{'Entry','Exit','Entry and Exit'},'Fontsize',16,'YDir','reverse','XAxisLocation','top');
box off;
xlabel('Testing strategy','Fontsize',18);
ylabel('Duration of quarantine with no testing','Fontsize',18);


text(0.003,-1.91,'B','Fontsize',32,'FontWeight','bold');

caxis([-0.5 21.5])
hh=colorbar;
hh.Ticks=[0:21];
hh.Label.String={'Equivalent duration of quarantine to no testing'};
hh.Label.Rotation=270;
hh.Label.Position=[4.5 10.5 0];
hh.Label.FontSize=18;

colormap(S2,cc);


end

