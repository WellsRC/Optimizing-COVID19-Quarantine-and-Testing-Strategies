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
    print(gcf,['Figure4'],'-depsc','-r600');