% Plots the probability of onward transmission for known time of infection
clear;
clc;
close all;

DTest=zeros(21,1);
DTestDelay=zeros(21,1);

CStrat=[hex2rgb('#D13525'); hex2rgb('#F77604'); hex2rgb('#2988BC'); hex2rgb('#54278f')];
qin=[14 7 5 3];
    figure('units','normalized','outerposition',[0 0 1 1]);
    for kk=1:4
        load('Known_Infection_ImpactQuarantine_DayTest_Latent=2point9.mat');
        
        qmmt=q(q==qin(kk));
        IDSLT=IDSL(q==qin(kk));
        dtmmt=dayTestv(q==qin(kk));
        DayERQ=DayERIv(q==qin(kk));
        maxDayERQ=max(DayERQ);
        for ii=1:maxDayERQ
            temp=zeros(qin(kk)+1,1);
            fd=find(DayERQ==ii);
            % No delay
            for jj=0:qin(kk)
                ft=find(dtmmt(fd)==jj);
                temp(jj+1)=IDSLT(fd(ft));
            end
            DTest(ii)=find(temp==min(temp),1)-1;
        end

        % Delay
        for ii=1:maxDayERQ
            temp=zeros(qin(kk),1);
            fd=find(DayERQ==ii);
            % No delay
            for jj=0:(qin(kk)-1)
                ft=find(dtmmt(fd)==jj);
                temp(jj+1)=IDSLT(fd(ft));
            end
            DTestDelay(ii)=find(temp==min(temp),1)-1;
        end

        subplot('Position',[0.07+(0.557-0.07).*rem(kk-1,2) 0.56-0.48*floor((kk-1)/2) 0.43 0.40]);

        yytick=[0 0.01 0.05:0.1:0.45];
        p2=plot([1:14],DTest(1:14),'-o','color',[0.7 0.7 0.7],'linewidth',2,'MarkerFaceColor',[0.7 0.7 0.7],'Markersize',7); hold on
        p1=plot([1:14],DTestDelay(1:14),'-ok','linewidth',2,'MarkerFaceColor','k','Markersize',7);
        if(kk==1)
        legend([p1 p2],{'One-day delay in obtaining test result','Negligible delay in obtaining test result'})
        legend boxoff;
        end
        if(kk>2)
            xlabel('Days post-infection entering quarantine','Fontsize',20);
        end
        ylabel({'Optimal day to conduct test'},'Fontsize',20);
        ylim([0 8]);
        xlim([0.5 14]);
        set(gca,'LineWidth',2,'tickdir','out','XTick',[1:14],'Fontsize',18,'YTick',[0:1:10]);
        box off;
        xlim([1 14]);
        ylim([ 0 8]);
        text(-0.035,8,char(64+kk) ,'Fontsize',32,'FontWeight','bold')
        box off;
        title([ num2str(qin(kk)) '-day quarantine'])
        
    end
    print(gcf,['Figure4'],'-dpng','-r600');

% for zz=1:3
%     figure('units','normalized','outerposition',[0 0 1 1]);
%     for kk=1:4
%         load('Known_Infection_ImpactQuarantine_Latent=2point9.mat');
%         IDSNT=IDSL(DayERIv==(kk+4.*(zz-1)));
%         temp=IDSA(DayERIv==(kk+4.*(zz-1)));
%         q=q(DayERIv==kk);
%         IDSNT=(IDSNT(q>0)')./pA;
%         temp=temp(q>0)';
%         if(max(abs(temp-IDSNT))>10^(-14))
%            [zz kk] 
%         end
%         load('Known_Infection_ImpactQuarantine_TestEntry_Latent=2point9.mat')
%         IDSTE=IDSL(DayERIv==(kk+4.*(zz-1)));
%         temp=IDSA(DayERIv==(kk+4.*(zz-1)));
%         q=q(DayERIv==kk);
%         IDSTE=(IDSTE(q>0)')./pA;
%         temp=temp(q>0)';
%         if(max(abs(temp-IDSTE))>10^(-14))
%            [zz kk] 
%         end
%         load('Known_Infection_ImpactQuarantine_TestExit_Latent=2point9_OneDayDelay.mat');
%         IDSTX=(IDSL(DayERIv==(kk+4.*(zz-1)))')./pA;        
%         temp=IDSA(DayERIv==(kk+4.*(zz-1)))';
%         
%         if(max(abs(temp-IDSTX))>10^(-14))
%            [zz kk] 
%         end
%         load('Known_Infection_ImpactQuarantine_TestEntryExit_Latent=2point9_OneDayDelay.mat');
%         IDSTEX=(IDSL(DayERIv==(kk+4.*(zz-1)))')./pA;
%         temp=IDSA(DayERIv==(kk+4.*(zz-1)))';
%         
%         if(max(abs(temp-IDSTEX))>10^(-14))
%            [zz kk] 
%         end
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         % Calculations
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Risk=1; % Does the negative Binomial
%         % Average probability of onward transmisison
%         Prob=[(Probability_Onward(IDSNT,Risk))' (Probability_Onward(IDSTE,Risk))' (Probability_Onward(IDSTX,Risk))' (Probability_Onward(IDSTEX,Risk))'];
% 
% 
%         subplot('Position',[0.07+(0.557-0.07).*rem(kk-1,2) 0.55-0.47*floor((kk-1)/2) 0.43 0.40]);
% 
%         yytick=[0 0.01 0.05:0.1:0.45];
%         for ii=1:4
%             plot(qt,sqrt(Prob(:,ii)),'-o','color',CStrat(ii,:),'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',CStrat(ii,:),'MarkerFaceColor',CStrat(ii,:)); hold on;
%         end
%         grid on;
%         xlim([1 15]);
%         ylim([ 0 sqrt(0.45)]);
%         if(kk+4.*(zz-1)==2)
%         legend({'No testing','Testing on entry','Testing on exit','Testing on both entry and exit'},'Fontsize',16,'Position',[0.81818977907999,0.838823382690334,0.155987391107473,0.108463210204467]);
%                legend boxoff
%         end
%         if((kk>1)||(zz==4)||(zz==6))
%             text(-0.476772616136923,0.7015,char(64+kk+4.*(zz-1)) ,'Fontsize',32,'FontWeight','bold')
%         else
%             text(-0.889471 ,0.7015,char(64+kk+4.*(zz-1)),'Fontsize',32,'FontWeight','bold')           
%         end
%         set(gca,'LineWidth',2,'tickdir','out','XTick',[1:15],'Fontsize',16,'Yminortick','on','YTick',sqrt(yytick),'YTickLabel',{num2str(yytick')})
%             box off;
%             title([num2str(kk+4.*(zz-1)) '-day quarantine'])
%             if(((kk==1)||(kk==3))&&((zz==3)||(zz==5)))
%              ylabel({'Probability of','post-quarantine transmission'},'Fontsize',18);
%             end
% 
%     end
%     print(gcf,['Supplement_Known_TimeInfection_' num2str(zz) ],'-dpng','-r600');
% end
% 
% 
% for zz=4:4
%     figure('units','normalized','outerposition',[0 0 1 1]);
%     for kk=1:2
%         load('Known_Infection_ImpactQuarantine_Latent=2point9.mat');
%         IDSNT=IDSL(DayERIv==(kk+4.*(zz-1)));
%         temp=IDSA(DayERIv==(kk+4.*(zz-1)));
%         q=q(DayERIv==kk);
%         IDSNT=(IDSNT(q>0)')./pA;
%         temp=temp(q>0)';
%         if(max(abs(temp-IDSNT))>10^(-14))
%            [zz kk] 
%         end
%         load('Known_Infection_ImpactQuarantine_TestEntry_Latent=2point9.mat')
%         IDSTE=IDSL(DayERIv==(kk+4.*(zz-1)));
%         temp=IDSA(DayERIv==(kk+4.*(zz-1)));
%         q=q(DayERIv==kk);
%         IDSTE=(IDSTE(q>0)')./pA;
%         temp=temp(q>0)';
%         if(max(abs(temp-IDSTE))>10^(-14))
%            [zz kk] 
%         end
%         load('Known_Infection_ImpactQuarantine_TestExit_Latent=2point9_OneDayDelay.mat');
%         IDSTX=(IDSL(DayERIv==(kk+4.*(zz-1)))')./pA;        
%         temp=IDSA(DayERIv==(kk+4.*(zz-1)))';
%         
%         if(max(abs(temp-IDSTX))>10^(-14))
%            [zz kk] 
%         end
%         load('Known_Infection_ImpactQuarantine_TestEntryExit_Latent=2point9_OneDayDelay.mat');
%         IDSTEX=(IDSL(DayERIv==(kk+4.*(zz-1)))')./pA;
%         temp=IDSA(DayERIv==(kk+4.*(zz-1)))';
%         
%         if(max(abs(temp-IDSTEX))>10^(-14))
%            [zz kk] 
%         end
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         % Calculations
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Risk=1; % Does the negative Binomial
%         % Average probability of onward transmisison
%         Prob=[(Probability_Onward(IDSNT,Risk))' (Probability_Onward(IDSTE,Risk))' (Probability_Onward(IDSTX,Risk))' (Probability_Onward(IDSTEX,Risk))'];
% 
% 
%         subplot('Position',[0.07+(0.557-0.07).*rem(kk-1,2) 0.55-0.47*floor((kk-1)/2) 0.43 0.40]);
% 
%         yytick=[0 0.01 0.05:0.1:0.45];
%         for ii=1:4
%             plot(qt,sqrt(Prob(:,ii)),'-o','color',CStrat(ii,:),'LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',CStrat(ii,:),'MarkerFaceColor',CStrat(ii,:)); hold on;
%         end
%         grid on;
%         xlim([1 15]);
%         ylim([ 0 sqrt(0.45)]);
%         if(kk+4.*(zz-1)==2)
%         legend({'No testing','Testing on entry','Testing on exit','Testing on both entry and exit'},'Fontsize',16,'Position',[0.81818977907999,0.838823382690334,0.155987391107473,0.108463210204467]);
%                legend boxoff
%         end
%         if((kk>1)||(zz==4)||(zz==6))
%             text(-0.476772616136923,0.7015,char(64+kk+4.*(zz-1)) ,'Fontsize',32,'FontWeight','bold')
%         else
%             text(-0.889471 ,0.7015,char(64+kk+4.*(zz-1)),'Fontsize',32,'FontWeight','bold')           
%         end
%         set(gca,'LineWidth',2,'tickdir','out','XTick',[1:15],'Fontsize',16,'Yminortick','on','YTick',sqrt(yytick),'YTickLabel',{num2str(yytick')})
%             box off;
%             title([num2str(kk+4.*(zz-1)) '-day quarantine'])
%             if(((kk==1)||(kk==3))&&((zz==3)||(zz==5)))
%              ylabel({'Probability of','post-quarantine transmission'},'Fontsize',18);
%             end
% 
%     end
%     print(gcf,['Supplement_Known_TimeInfection_' num2str(zz) ],'-dpng','-r600');
% end
% 
