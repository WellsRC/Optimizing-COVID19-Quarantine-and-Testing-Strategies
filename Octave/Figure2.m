close all;
clear;
clc;

figure('units','normalized','outerposition',[0 0 1 1]);
for ii=1:2
    switch ii
        case 1
            load('TableData_A.mat');
        case 2
            load('TableData_B.mat');
    end
   

subplot('Position',[0.07+(0.555-0.055).*(ii-1),0.56,0.42,0.4]);
if(ii==2)
    b=bar([1 1.5 2.5 3 3.5], yy,'k','LineStyle','none'); hold on
    xx=[1 1.5 2.5 3 3.5];
    
    b.FaceColor = 'flat';
    b.CData(4,:)=hex2rgb('#D70026');
    annotation('line',[0.195,0.321]+0.08+0.5,[0.478 0.478],'color','k','LineWidth',2)
    annotation('line',[0.195,0.195]+0.08+0.5,[0.478 0.508],'color','k','LineWidth',2)
    annotation('line',[0.321,0.321]+0.08+0.5,[0.478 0.508],'color','k','LineWidth',2)
    annotation('line',[0.2580 0.2580]+0.08+0.5,[0.478 0.448],'color','k','LineWidth',2)
    yt(3)./(yt(2)+yt(3))
    for tt=1:5
        if(~isnan(yy(tt)))
           text(xx(tt),yy(tt),['(' num2str(yt(tt)) ' / ' num2str(nn(tt)) ')'],'Fontsize',16,'Horizontalalignment','center','Verticalalignment','bottom'); 
        else
            text(xx(tt),0,['(' num2str(yt(tt)) ' / ' num2str(nn(tt)) ')'],'Fontsize',16,'Horizontalalignment','center','Verticalalignment','bottom'); 
        end
    end
    set(gca,'tickdir','out','YTick',[0:0.005:0.035],'YTickLabel',{'0','0.5','1.0','1.5','2.0','2.5','3.0','3.5'},'XTick',xx,'Yminortick','on','XTickLabel',{'Entry only \newline      ( )',['11 days \newline (' char(8722) ',  )'],'Entry \newline  ( )',[' 96 hrs \newline (' char(8722) ',  )'],['11 days \newline(' char(8722) ',' char(8722) ',  )']},'LineWidth',2,'Fontsize',16)
    % xtickangle(45);
    ylim([0 0.035]);
    text(1.25,0.035,'April 11 - June 24','Fontsize',18,'HorizontalAlignment','center');
    text(3,0.035,'June 25 - August 26','Fontsize',18,'HorizontalAlignment','center');
    ylabel('Positivity rate (%)','Fontsize',18);
    text(2.44,-0.0106,'Entry and Exit','Fontsize',16)
    xlabel('Time of testing','Fontsize',18,'Position',[2.25,-0.012,-1]);
    text(-0.01,max(ylim),char(64+ii),'Fontsize',32,'FontWeight','bold');
    box off;
    xlim([0.5 4]);
    plot(2.*ones(1,101),linspace(0,0.035,101),'-.','color',[0.6 0.6 0.6],'LineWidth',2);
else
    b=bar([1 2 2.5], yy,'k','LineStyle','none'); hold on
    xx=[1 2 2.5];
    
    b.FaceColor = 'flat';
    b.CData(3,:)=hex2rgb('#D70026');
    annotation('line',[0.754726890756303,0.971638655462185]-0.5,[0.478 0.478],'color','k','LineWidth',2)
    annotation('line',[0.754726890756303,0.754726890756303]-0.5,[0.478 0.508],'color','k','LineWidth',2)
    annotation('line',[0.971638655462185,0.971638655462185]-0.5,[0.478 0.508],'color','k','LineWidth',2)
    annotation('line',[0.8632 0.8632]-0.5,[0.478 0.448],'color','k','LineWidth',2)
    yt(3)./(yt(2)+yt(3))
    for tt=1:3
        if(~isnan(yy(tt)))
           text(xx(tt),yy(tt),['(' num2str(yt(tt)) ' / ' num2str(nn(tt)) ')'],'Fontsize',16,'Horizontalalignment','center','Verticalalignment','bottom'); 
        else
            text(xx(tt),0,['(' num2str(yt(tt)) ' / ' num2str(nn(tt)) ')'],'Fontsize',16,'Horizontalalignment','center','Verticalalignment','bottom'); 
        end
    end
    set(gca,'tickdir','out','YTick',[0:0.005:0.035],'XTick',[1 2 2.5],'YTickLabel',{'0','0.5','1.0','1.5','2.0','2.5','3.0','3.5'},'Yminortick','on','XTickLabel',{'Entry only \newline      ( )','Entry \newline   ( )',[' 96 hrs \newline (' char(8722) ',  )']},'LineWidth',2,'Fontsize',16)
    % xtickangle(45);
    ylim([0 0.035]);    
    text(1,0.035,'April 11 - August 12','Fontsize',18,'HorizontalAlignment','center');
    text(2.25,0.035,'August 13 - August 26','Fontsize',18,'HorizontalAlignment','center');
    ylabel('Positivity rate (%)','Fontsize',18);
    text(2.01,-0.0106,'Entry and Exit','Fontsize',16)
    xlabel('Time of testing','Fontsize',18,'Position',[1.75,-0.012,-1]);
    text(0.147,max(ylim),char(64+ii),'Fontsize',32,'FontWeight','bold');
    box off;
    xlim([0.5 3]);
    plot(1.5.*ones(1,101),linspace(0,0.035,101),'-.','color',[0.6 0.6 0.6],'LineWidth',2);
end
if(ii==2)
    text(0.9525,-0.005230149597238,'+','FontWeight','bold','Fontsize',16);
    text(1.488435563816605,-0.005230149597238,'+','FontWeight','bold','Fontsize',16);
    text(2.4469,-0.005230149597238,'+','FontWeight','bold','Fontsize',16);
    text(3.002066294919456,-0.005230149597238,'+','FontWeight','bold','Fontsize',16);
    text(3.5572,-0.005230149597238,'+','FontWeight','bold','Fontsize',16);
else
    text(0.965625,-0.005230149597238,'+','FontWeight','bold','Fontsize',16);
    text(1.9817,-0.005230149597238,'+','FontWeight','bold','Fontsize',16);
    text(2.5052,-0.005230149597238,'+','FontWeight','bold','Fontsize',16);
end

end

print(gcf,'Figure2','-dpng','-r600');
