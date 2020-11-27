function  [fig1]=FigureChart(IDSNT,IDSTE,IDSTX,IDSTEX,q)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Average probability of onward transmisison

% Expected number of secondary infctions (Rounding for the use in the
% table)
IDSNT=round(IDSNT,3);
IDSTE=round(IDSTE,3);
IDSTX=round(IDSTX,3);
IDSTEX=round(IDSTEX,3);

 CC=[hex2rgb('#F5BE41');hex2rgb('#2D4262');hex2rgb('#31A9BB');hex2rgb('#BBCF4A')];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Table Output
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Testing_Strategy={'On exit','On entry','On entry and exit'}';

% Duration_Quarantine=zeros(3,1);
% Expected_Infections=zeros(3,1);
% 
% md=find(IDSTE<=ESI,1);
% Duration_Quarantine(1)=q(md);
% Expected_Infections(1)=IDSTE(md);
% 
% md=find(IDSTX<=ESI,1);
% Duration_Quarantine(2)=q(md);
% Expected_Infections(2)=IDSTX(md);
% 
% md=find(IDSTEX<=ESI,1);
% Duration_Quarantine(3)=q(md);
% Expected_Infections(3)=IDSTEX(md);
% 
% T = table(Testing_Strategy,Duration_Quarantine,Expected_Infections);

% 
% % Vectors for the duration of quarantine equivialent to no testing
% No_Testing=q';
% Test_Entry=zeros(size(No_Testing));
% Test_Exit=zeros(size(No_Testing));
% Test_Entry_Exit=zeros(size(No_Testing));
% 
% for ii=1:length(q)
%     % Expected number of secodnary infections post quaratnine NO TESTING
%     ESI=IDSNT(ii);
%     md=find(IDSTE<=ESI,1); % Find the equivilent or better with testing on entry (i.e. fewer expected cases)
%     Test_Entry(ii)=q(md); % Record duration of quarantine
%      
%     md=find(IDSTX<=ESI,1);% Find the equivilent or better with testing on exit (i.e. fewer expected cases)
%     Test_Exit(ii)=q(md); % Record duration of quarantine
%     
%     md=find(IDSTEX<=ESI,1); % Find the equivilent or better with testing on entry and exit (i.e. fewer expected cases)
%     Test_Entry_Exit(ii)=q(md); % Record duration of quarantine
% end
% 
% T2 = table(No_Testing,Test_Entry,Test_Exit,Test_Entry_Exit);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig1=figure('units','normalized','outerposition',[0 0 0.5 1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate Panel B: Probability of onward transmission
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S1=subplot('Position',[0.08 0.01 0.8 0.915]);


load('Colormap2.mat');
CCC(1,:)=[1 1 1];
CCC=CCC(1:11,:);
RR=[0.1:0.1:1 2];
for ii=0:21
    
    % Not testing
    ss=0;
    ff=find(RR>=IDSNT(ii+1),1);
    % Determine the level of rounding wanted based on the number
    rn=3;
    patch(ss+[-0.5 0.5 0.5 -0.5],ii+[-0.5 -0.5 0.5 0.5], CCC(ff,:)); hold on
    if(round(IDSNT(ii+1),rn)>0)
        text(ss,ii,num2str(round(IDSNT(ii+1),rn)),'HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    else
        text(ss,ii,'<0.001','HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    end
    % Testing on entry
    ss=1;
    ff=find(RR>=IDSTE(ii+1),1);    
    % Determine the level of rounding wanted based on the number
    rn=3;
    patch(ss+[-0.5 0.5 0.5 -0.5],ii+[-0.5 -0.5 0.5 0.5], CCC(ff,:)); hold on
    if(round(IDSTE(ii+1),rn)>0)
        text(ss,ii,num2str(round(IDSTE(ii+1),rn)),'HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    else
        text(ss,ii,'<0.001','HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    end
    % Testing on exit
    ss=2;
    ff=find(RR>=IDSTX(ii+1),1);
    % Determine the level of rounding wanted based on the number
    rn=3;
    patch(ss+[-0.5 0.5 0.5 -0.5],ii+[-0.5 -0.5 0.5 0.5], CCC(ff,:)); hold on
    if(round(IDSTX(ii+1),rn)>0)
        text(ss,ii,num2str(round(IDSTX(ii+1),rn)),'HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    else
        text(ss,ii,'<0.001','HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    end
    
    % Testing on entry and exit
    ss=3;
    % Determine the level of rounding wanted based on the number
    ff=find(RR>=IDSTEX(ii+1),1);
    rn=3;
    patch(ss+[-0.5 0.5 0.5 -0.5],ii+[-0.5 -0.5 0.5 0.5], CCC(ff,:)); hold on
    if(round(IDSTEX(ii+1),rn)>0)
        text(ss,ii,num2str(round(IDSTEX(ii+1),rn)),'HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    else
        text(ss,ii,'<0.001','HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    end
end
ylim([-0.5 21.5]);
xlim([-0.5 3.5]);
set(gca,'LineWidth',2,'tickdir','out','XTick',[0 1 2 3],'YTick',q,'XTickLabel',{'No testing','Entry','Exit','Entry and Exit'},'Fontsize',16,'YDir','reverse','XAxisLocation','top');
box off;
xlabel('Testing strategy','Fontsize',18);
ylabel('Duration of quarantine','Fontsize',18);

caxis([-0.5 10.5])
hh=colorbar;
hh.Ticks=[0:11];
hh.TickLabels={'0 to 0.1','0.1 to 0.2','0.2 to 0.3','0.3 to 0.4','0.4 to 0.5','0.5 to 0.6','0.6 to 0.7','0.7 to 0.8','0.8 to 0.9','0.9 to 1.0','1.0 +'};
hh.Label.String={'Expected post-quarantine transmission'};
hh.Label.Rotation=270;
hh.Label.Position=[7.25 5.5 0];
hh.Label.FontSize=18;

colormap(S1,CCC);



end

