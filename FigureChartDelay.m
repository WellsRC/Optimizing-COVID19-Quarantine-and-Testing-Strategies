function  [fig1]=FigureChartDelay(IDSNT,IDSTE,IDSTX,IDSTEX,tsv,q,PD)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% What probability density function to use for the incubatinop period
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(PD==0)
    p=PDFavgIncubation(tsv,tsv(2)-tsv(1));
else
    p=PDFavgIncubation_Alt(tsv,tsv(2)-tsv(1));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Expected number of secondary infctions
IDSNT=round(p*IDSNT,3);
IDSTE=round(p*IDSTE,3);
IDSTX=round(p*IDSTX,3);
IDSTEX=round(p*IDSTEX,3);

 CC=[hex2rgb('#F5BE41');hex2rgb('#2D4262');hex2rgb('#31A9BB');hex2rgb('#BBCF4A')];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Table Output
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Testing_Strategy={'On exit','On entry','On entry and exit'}';

f14=find(q==14);
ESI=IDSNT(f14);


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


% Vectors for the duration of quarantine equivialent to no testing
No_Testing=q';
Test_Entry=zeros(size(No_Testing));
Test_Exit=zeros(size(No_Testing));
Test_Entry_Exit=zeros(size(No_Testing));

for ii=1:length(q)
    % Expected number of secodnary infections post quaratnine NO TESTING
    ESI=IDSNT(ii);
    md=find(IDSTE<=ESI,1); % Find the equivilent or better with testing on entry (i.e. fewer expected cases)
    Test_Entry(ii)=q(md); % Record duration of quarantine
     
    md=find(IDSTX<=ESI,1);% Find the equivilent or better with testing on exit (i.e. fewer expected cases)
    Test_Exit(ii)=q(md); % Record duration of quarantine
    
    md=find(IDSTEX<=ESI,1); % Find the equivilent or better with testing on entry and exit (i.e. fewer expected cases)
    Test_Entry_Exit(ii)=q(md); % Record duration of quarantine
end

T2 = table(No_Testing,Test_Entry,Test_Exit,Test_Entry_Exit);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate Figure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig1=figure('units','normalized','outerposition',[0 0 0.65 1]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate Panel A: SEcondary infections
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S1=subplot('Position',[0.06 0.01 0.38 0.915]);


load('Colormap2.mat');
CCC(1,:)=[1 1 1];
CCC=CCC(1:11,:);
RR=[0.1:0.1:1 2];
for ii=1:21
    
    % Not testing
    ss=0;
    ff=find(RR>=IDSNT(ii),1);
    % Determine the level of rounding wanted based on the number
    rn=3;
    patch(ss+[-0.5 0.5 0.5 -0.5],ii+[-0.5 -0.5 0.5 0.5], CCC(ff,:)); hold on
    if(round(IDSNT(ii),rn)>0)
        text(ss,ii,num2str(round(IDSNT(ii),rn)),'HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    else
        text(ss,ii,'<0.001','HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    end
    % Testing on entry
    ss=1;
    ff=find(RR>=IDSTE(ii),1);    
    % Determine the level of rounding wanted based on the number
    rn=3;
    patch(ss+[-0.5 0.5 0.5 -0.5],ii+[-0.5 -0.5 0.5 0.5], CCC(ff,:)); hold on
    if(round(IDSTE(ii),rn)>0)
        text(ss,ii,num2str(round(IDSTE(ii),rn)),'HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    else
        text(ss,ii,'<0.001','HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    end
    % Testing on exit
    ss=2;
    ff=find(RR>=IDSTX(ii),1);
    % Determine the level of rounding wanted based on the number
    rn=3;
    patch(ss+[-0.5 0.5 0.5 -0.5],ii+[-0.5 -0.5 0.5 0.5], CCC(ff,:)); hold on
    if(round(IDSTX(ii),rn)>0)
        text(ss,ii,num2str(round(IDSTX(ii),rn)),'HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    else
        text(ss,ii,'<0.001','HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    end
    
    % Testing on entry and exit
    ss=3;
    % Determine the level of rounding wanted based on the number
    ff=find(RR>=IDSTEX(ii),1);
    rn=3;
    patch(ss+[-0.5 0.5 0.5 -0.5],ii+[-0.5 -0.5 0.5 0.5], CCC(ff,:)); hold on
    if(round(IDSTEX(ii),rn)>0)
        text(ss,ii,num2str(round(IDSTEX(ii),rn)),'HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    else
        text(ss,ii,'<0.001','HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    end
end
ylim([0.5 21.5]);
xlim([-0.5 3.5]);
set(gca,'LineWidth',2,'tickdir','out','XTick',[0 1 2 3],'YTick',q,'XTickLabel',{'No testing','Entry','Exit','Entry and Exit'},'Fontsize',16,'YDir','reverse','XAxisLocation','top');
box off;
xlabel('Testing strategy','Fontsize',18);
ylabel('Duration quarantine','Fontsize',18);

caxis([-0.5 10.5])
hh=colorbar;
hh.Ticks=[0:11];
hh.TickLabels={'0 to 0.1','0.1 to 0.2','0.2 to 0.3','0.3 to 0.4','0.4 to 0.5','0.5 to 0.6','0.6 to 0.7','0.7 to 0.8','0.8 to 0.9','0.9 to 1.0','1.0 +'};
hh.Label.String={'Expected number of secondary infections post-quarantine'};
hh.Label.Rotation=270;
hh.Label.Position=[7.25 5.5 0];
hh.Label.FontSize=18;

colormap(S1,CCC);

text(-0.940789473684211,-0.92,'A','Fontsize',32,'FontWeight','bold');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate Panel B: Equiv strategies
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S2=subplot('Position',[0.58 0.01 0.38 0.915]);

load('CCTest.mat');
cc=cc(2:end,:);

for ii=1:21
    % Testing on entry
    ss=1;
    patch(ss+[-0.5 0.5 0.5 -0.5],ii+[-0.5 -0.5 0.5 0.5], cc(Test_Entry(ii),:)); hold on
    text(ss,ii,num2str(round((Test_Entry(ii)),2)),'HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    % Testing on exit
    ss=2;
    patch(ss+[-0.5 0.5 0.5 -0.5],ii+[-0.5 -0.5 0.5 0.5], cc(Test_Exit(ii),:)); hold on
    text(ss,ii,num2str(round((Test_Exit(ii)),2)),'HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
    % Testing on entry and exit
    ss=3;
    patch(ss+[-0.5 0.5 0.5 -0.5],ii+[-0.5 -0.5 0.5 0.5], cc(Test_Entry_Exit(ii),:)); hold on
    text(ss,ii,num2str(round((Test_Entry_Exit(ii)),2)),'HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',14);
end
ylim([0.5 21.5]);
xlim([0.5 3.5]);
set(gca,'LineWidth',2,'tickdir','out','XTick',[1 2 3],'YTick',q,'XTickLabel',{'Entry','Exit','Entry and Exit'},'Fontsize',16,'YDir','reverse','XAxisLocation','top');
box off;
xlabel('Testing strategy','Fontsize',18);
ylabel('Duration of quarantine with no testing','Fontsize',18);


text(0.128,-0.92,'B','Fontsize',32,'FontWeight','bold');

caxis([0.5 21.5])
hh=colorbar;
hh.Ticks=[1:21];
hh.Label.String={'Equivalent duration of quarantine to no testing'};
hh.Label.Rotation=270;
hh.Label.Position=[4.5 10.5 0];
hh.Label.FontSize=18;

colormap(S2,cc);

end

