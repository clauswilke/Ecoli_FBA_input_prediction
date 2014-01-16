close all
clear all
clc
%FluxData1
%load Replicates_Noise\FluxDataCarbonNoiseLevel1.mat
FluxData1=xlsread('ArtificialNitrogen.xlsx');
%FluxData1=FluxData2;
sizeFluxData1=size(FluxData1);

    % % %%%%%%%%%%%%%%  Carbon Sources  %%%%%%%%%%%%%%%%%%%%%%%%%
% % D-glucose - 'D-Glucose exchange' - 'EX_glc(e)' - 849
% % pyruvate - 'Pyruvate exchange' - 'EX_pyr(e)' - 955
% % glycerol - 'Glycerol exchange'  - 'EX_glyc(e)' - 861
% % acetate - 'Acetate exchange' - 'EX_ac(e)' - 729
% % D-ribose - 'D-Ribose exchange' - 'EX_rib_D(e)' - 957
% % D-fructose - 'D-Fructose exchange' - 'EX_fru(e)' - 825
% % D-sorbitol - 'D-Sorbitol exchange' - 'EX_sbt_D(e)' - 959
% % D-galactose - 'D-Galactose exchange' - 'EX_gal(e)' - 838
% % D-lactose (galactose + glucose) - 'Lactose exchange' - 'EX_lcts(e)' - 895
% % D-mannose - 'D-Mannose exchange' - 'EX_man(e)' - 909
% % %%%%%%%%%%%%%%  Nitrogen Sources  %%%%%%%%%%%%%%%%%%%%%%%%%
% % ammonia - 'Ammonia exchange' - 'EX_nh4(e)' - 926
% % adenine - 'Adenine exchange' - 'EX_ade(e)' - 741
% % cytidine - 'Cytidine exchange' - 'EX_cytd(e)' - 787
% % putrescine - 'Putrescine exchange' - 'EX_ptrc(e)' - 954
% % L-glycine - 'Glycine exchange' - 'EX_gly(e)' - 856
% % L-alanine - 'L-Alanine exchange' - 'EX_ala_L(e)' - 749
% % L-glutamine  - 'L-Glutamine exchange' -  'EX_gln_L(e)' - 854
% % L-arginine - 'L-Arginine exchange' - 'EX_arg_L(e)' - 758
% % D-glucosamine - 'D-Glucosamine exchange' - 'EX_gam(e)' - 846
% % Gamma-amino-N-butyric acid - ' 4-Aminobutanoate exchange' - 'EX_4abut(e)' - 724
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

C_ii=[849,955,861,729,957,825,959];
N_ii=[926,741,787,954,856,749,854];
FluxDataCN=zeros(7,7,1,2);
        for C_i=1:7
            for N_i=1:7
                counter=1;
                for i=1:sizeFluxData1(1)
                    
                    if(FluxData1(i,2383)==C_i && FluxData1(i,2384)==N_i)
                        colorball=[-100 -100 -100];
                        if(FluxData1(i,2383)==FluxData1(i,2386) && FluxData1(i,2384)==FluxData1(i,2387))
                          colorball=[0 1 0];% green, all correct
                        elseif(FluxData1(i,2383)==FluxData1(i,2386))
                                colorball=[0 0 1];%blue carbon
                        elseif(FluxData1(i,2384)==FluxData1(i,2387))
                                colorball=[0.66 0.13 1];% purple nitrogen
                                    else
                                        colorball=[1 0 0];% red all wrong
                            end
                    FluxDataCN(C_i,N_i,counter,:)=[FluxData1(i,C_ii(C_i)) FluxData1(i,N_ii(N_i))];
                    FluxDataCNcolor(C_i,N_i,counter,:)=colorball;
                    counter=counter+1;
                    end
                     
                end
            end
        end
%         sizeFDCN=size(FluxDataCN);
%         for C_i=1:7
%             for N_i=1:7
%                 for counter1=1:sizeFDCN(3)
%                     if(FluxDataCNcolor(C_i,N_i,counter1,1)==0 && FluxDataCNcolor(C_i,N_i,counter1,2)==0 && FluxDataCNcolor(C_i,N_i,counter1,3)==0)
%                         FluxDataCNcolor(:,:,:,1)=1;FluxDataCNcolor(:,:,:,2)=1;FluxDataCNcolor(:,:,:,3)=1;
%                     end
%                 end
%             end
%         end
       
        %if(FluxDataCNcolor(:,:,:,1)==0 & FluxDataCNcolor(:,:,:,2)==0 & FluxDataCNcolor(:,:,:,3)==0)
         %   FluxDataCNcolor(:,:,:,1)=1;FluxDataCNcolor(:,:,:,2)=1;FluxDataCNcolor(:,:,:,3)=1;
        %end
        
        figure(1)
        subplot(7,7,1)
        plot(mean(FluxDataCN(1,1,:,1)),mean(FluxDataCN(1,1,:,2)));
        axis([-30 30 -1000 1000]);
        subplot(7,7,2)
        plot(mean(FluxDataCN(1,2,:,1)),mean(FluxDataCN(1,2,:,2)));
        axis([-30 30 -1000 1000]);
        subplot(7,7,3)
        plot(mean(FluxDataCN(1,3,:,1)),mean(FluxDataCN(1,3,:,2)));
        axis([-30 30 -1000 1000]);
        subplot(7,7,4)
        plot(mean(FluxDataCN(1,4,:,1)),mean(FluxDataCN(1,4,:,2)));
        axis([-30 30 -1000 1000]);
        subplot(7,7,5)
        plot(mean(FluxDataCN(1,5,:,1)),mean(FluxDataCN(1,5,:,2)));
        axis([-30 30 -1000 1000]);
        subplot(7,7,6)
        plot(mean(FluxDataCN(1,6,:,1)),mean(FluxDataCN(1,6,:,2)));
        axis([-30 30 -1000 1000]);
        subplot(7,7,7)
        plot(mean(FluxDataCN(1,7,:,1)),mean(FluxDataCN(1,7,:,2)));
        axis([-30 30 -1000 1000]);
        subplot(7,7,8)
        plot(mean(FluxDataCN(2,1,:,1)),mean(FluxDataCN(2,1,:,2)));
        axis([-30 30 -1000 1000]);
        subplot(7,7,9)
        plot(mean(FluxDataCN(2,2,:,1)),mean(FluxDataCN(2,2,:,2)));
        axis([-30 30 -1000 1000]);
        subplot(7,7,10)
        plot(mean(FluxDataCN(2,3,:,1)),mean(FluxDataCN(2,3,:,2)));
        subplot(7,7,11)
        plot(mean(FluxDataCN(2,4,:,1)),mean(FluxDataCN(2,4,:,2)));
        subplot(7,7,12)
        plot(mean(FluxDataCN(2,5,:,1)),mean(FluxDataCN(2,5,:,2)));
        subplot(7,7,13)
        plot(mean(FluxDataCN(2,6,:,1)),mean(FluxDataCN(2,6,:,2)));
        subplot(7,7,14)
        plot(mean(FluxDataCN(2,7,:,1)),mean(FluxDataCN(2,7,:,2)));
        subplot(7,7,15)
        plot(mean(FluxDataCN(3,1,:,1)),mean(FluxDataCN(3,1,:,2)));
        subplot(7,7,16)
        plot(mean(FluxDataCN(3,2,:,1)),mean(FluxDataCN(3,2,:,2)));
        subplot(7,7,17)
        plot(mean(FluxDataCN(3,3,:,1)),mean(FluxDataCN(3,3,:,2)));
        subplot(7,7,18)
        plot(mean(FluxDataCN(3,4,:,1)),mean(FluxDataCN(3,4,:,2)));
        subplot(7,7,19)
        plot(mean(FluxDataCN(3,5,:,1)),mean(FluxDataCN(3,5,:,2)));
        subplot(7,7,20)
        plot(mean(FluxDataCN(3,6,:,1)),mean(FluxDataCN(3,6,:,2)));
        subplot(7,7,21)
        plot(mean(FluxDataCN(3,7,:,1)),mean(FluxDataCN(3,7,:,2)));
        subplot(7,7,22)
        plot(mean(FluxDataCN(4,1,:,1)),mean(FluxDataCN(4,1,:,2)));
        subplot(7,7,23)
        plot(mean(FluxDataCN(4,2,:,1)),mean(FluxDataCN(4,2,:,2)));
        subplot(7,7,24)
        plot(mean(FluxDataCN(4,3,:,1)),mean(FluxDataCN(4,3,:,2)));
        subplot(7,7,25)
        plot(mean(FluxDataCN(4,4,:,1)),mean(FluxDataCN(4,4,:,2)));
        subplot(7,7,26)
        plot(mean(FluxDataCN(4,5,:,1)),mean(FluxDataCN(4,5,:,2)));
        subplot(7,7,27)
        plot(mean(FluxDataCN(4,6,:,1)),mean(FluxDataCN(4,6,:,2)));
        subplot(7,7,28)
        plot(mean(FluxDataCN(4,7,:,1)),mean(FluxDataCN(4,7,:,2)));
        subplot(7,7,29)
        plot(mean(FluxDataCN(5,1,:,1)),mean(FluxDataCN(5,1,:,2)));
        subplot(7,7,30)
        plot(mean(FluxDataCN(5,2,:,1)),mean(FluxDataCN(5,2,:,2)));
        subplot(7,7,31)
        plot(mean(FluxDataCN(5,3,:,1)),mean(FluxDataCN(5,3,:,2)));
        subplot(7,7,32)
        plot(mean(FluxDataCN(5,4,:,1)),mean(FluxDataCN(5,4,:,2)));
        subplot(7,7,33)
        plot(mean(FluxDataCN(5,5,:,1)),mean(FluxDataCN(5,5,:,2)));
        subplot(7,7,34)
        plot(mean(FluxDataCN(5,6,:,1)),mean(FluxDataCN(5,6,:,2)));
        subplot(7,7,35)
        plot(mean(FluxDataCN(5,7,:,1)),mean(FluxDataCN(5,7,:,2)));
        subplot(7,7,36)
        plot(mean(FluxDataCN(6,1,:,1)),mean(FluxDataCN(6,1,:,2)));
        subplot(7,7,37)
        plot(mean(FluxDataCN(6,2,:,1)),mean(FluxDataCN(6,2,:,2)));
        subplot(7,7,38)
        plot(mean(FluxDataCN(6,3,:,1)),mean(FluxDataCN(6,3,:,2)));
        subplot(7,7,39)
        plot(mean(FluxDataCN(6,4,:,1)),mean(FluxDataCN(6,4,:,2)));
        subplot(7,7,40)
        plot(mean(FluxDataCN(6,5,:,1)),mean(FluxDataCN(6,5,:,2)));
        subplot(7,7,41)
        plot(mean(FluxDataCN(6,6,:,1)),mean(FluxDataCN(6,6,:,2)));
        subplot(7,7,42)
        plot(mean(FluxDataCN(6,7,:,1)),mean(FluxDataCN(6,7,:,2)));
        subplot(7,7,43)
        plot(mean(FluxDataCN(7,1,:,1)),mean(FluxDataCN(7,1,:,2)));
        subplot(7,7,44)
        plot(mean(FluxDataCN(7,2,:,1)),mean(FluxDataCN(7,2,:,2)));
        subplot(7,7,45)
        plot(mean(FluxDataCN(7,3,:,1)),mean(FluxDataCN(7,3,:,2)));
        subplot(7,7,46)
        plot(mean(FluxDataCN(7,4,:,1)),mean(FluxDataCN(7,4,:,2)));
        subplot(7,7,47)
        plot(mean(FluxDataCN(7,5,:,1)),mean(FluxDataCN(7,5,:,2)));
        subplot(7,7,48)
        plot(mean(FluxDataCN(7,6,:,1)),mean(FluxDataCN(7,6,:,2)));
        subplot(7,7,49)
        plot(mean(FluxDataCN(7,7,:,1)),mean(FluxDataCN(7,7,:,2)));
        
        figure(2)
        set(gcf,'PaperPositionMode','auto');
        set(gcf, 'PaperSize', [15 9]);
        subplot(7,7,1)
        scatter(FluxDataCN(1,1,1:49,1),FluxDataCN(1,1,1:49,2),50,reshape(FluxDataCNcolor(1,1,1:49,:),49,3),'filled');
        xlabel('Glucose');
        ylabel('Ammonia');
        axis([-30 30 -1000 1000]);
        subplot(7,7,2)
        scatter(FluxDataCN(1,2,1:49,1),FluxDataCN(1,2,1:49,2),50,reshape(FluxDataCNcolor(1,2,1:49,:),49,3),'filled');
        xlabel('Glucose');
        ylabel('Adenine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,3)
        scatter(FluxDataCN(1,3,:,1),FluxDataCN(1,3,:,2),50,reshape(FluxDataCNcolor(1,3,:,:),50,3),'filled');
        xlabel('Glucose');
        ylabel('Cytidine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,4)
        scatter(FluxDataCN(1,4,:,1),FluxDataCN(1,4,:,2),50,reshape(FluxDataCNcolor(1,4,:,:),50,3),'filled');
        xlabel('Glucose');
        ylabel('Putrescine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,5)
        scatter(FluxDataCN(1,5,:,1),FluxDataCN(1,5,:,2),50,reshape(FluxDataCNcolor(1,5,:,:),50,3),'filled');
        xlabel('Glucose');
        ylabel('Glycine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,6)
        scatter(FluxDataCN(1,6,:,1),FluxDataCN(1,6,:,2),50,reshape(FluxDataCNcolor(1,6,:,:),50,3),'filled');
        xlabel('Glucose');
        ylabel('Alanine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,7)
        scatter(FluxDataCN(1,7,:,1),FluxDataCN(1,7,:,2),50,reshape(FluxDataCNcolor(1,7,:,:),50,3),'filled');
        xlabel('Glucose');
        ylabel('Glutamine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,8)
        scatter(FluxDataCN(2,1,:,1),FluxDataCN(2,1,:,2),50,reshape(FluxDataCNcolor(2,1,:,:),50,3),'filled');
        xlabel('Pyruvate');
        ylabel('Ammonia');
        axis([-30 30 -1000 1000]);
        subplot(7,7,9)
        scatter(FluxDataCN(2,2,:,1),FluxDataCN(2,2,:,2),50,reshape(FluxDataCNcolor(2,2,:,:),50,3),'filled');
        xlabel('Pyruvate');
        ylabel('Adenine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,10)
        scatter(FluxDataCN(2,3,:,1),FluxDataCN(2,3,:,2),50,reshape(FluxDataCNcolor(2,3,:,:),50,3),'filled');
        xlabel('Pyruvate');
        ylabel('Cytidine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,11)
        scatter(FluxDataCN(2,4,:,1),FluxDataCN(2,4,:,2),50,reshape(FluxDataCNcolor(2,4,:,:),50,3),'filled');
        xlabel('Pyruvate');
        ylabel('Putrescine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,12)
        scatter(FluxDataCN(2,5,:,1),FluxDataCN(2,5,:,2),50,reshape(FluxDataCNcolor(2,5,:,:),50,3),'filled');
        xlabel('Pyruvate');
        ylabel('Glycine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,13)
        scatter(FluxDataCN(2,6,:,1),FluxDataCN(2,6,:,2),50,reshape(FluxDataCNcolor(2,6,:,:),50,3),'filled');
        xlabel('Pyruvate');
        ylabel('Alanine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,14)
        scatter(FluxDataCN(2,7,:,1),FluxDataCN(2,7,:,2),50,reshape(FluxDataCNcolor(2,7,:,:),50,3),'filled');
        xlabel('Pyruvate');
        ylabel('Glutamine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,15)
        scatter(FluxDataCN(3,1,:,1),FluxDataCN(3,1,:,2),50,reshape(FluxDataCNcolor(3,1,:,:),50,3),'filled');
        xlabel('Glycerol');
        ylabel('Ammonia');
        axis([-30 30 -1000 1000]);
        subplot(7,7,16)
        scatter(FluxDataCN(3,2,:,1),FluxDataCN(3,2,:,2),50,reshape(FluxDataCNcolor(3,2,:,:),50,3),'filled');
        xlabel('Glycerol');
        ylabel('Adenine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,17)
        scatter(FluxDataCN(3,3,:,1),FluxDataCN(3,3,:,2),50,reshape(FluxDataCNcolor(3,3,:,:),50,3),'filled');
        xlabel('Glycerol');
        ylabel('Cytidine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,18)
        scatter(FluxDataCN(3,4,:,1),FluxDataCN(3,4,:,2),50,reshape(FluxDataCNcolor(3,4,:,:),50,3),'filled');
        xlabel('Glycerol');
        ylabel('Putrescine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,19)
        scatter(FluxDataCN(3,5,:,1),FluxDataCN(3,5,:,2),50,reshape(FluxDataCNcolor(3,5,:,:),50,3),'filled');
        xlabel('Glycerol');
        ylabel('Glycine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,20)
        scatter(FluxDataCN(3,6,:,1),FluxDataCN(3,6,:,2),50,reshape(FluxDataCNcolor(3,6,:,:),50,3),'filled');
        xlabel('Glycerol');
        ylabel('Alanine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,21)
        scatter(FluxDataCN(3,7,:,1),FluxDataCN(3,7,:,2),50,reshape(FluxDataCNcolor(3,7,:,:),50,3),'filled');
        xlabel('Glycerol');
        ylabel('Glutamine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,22)
        scatter(FluxDataCN(4,1,1:36,1),FluxDataCN(4,1,1:36,2),50,reshape(FluxDataCNcolor(4,1,1:36,:),36,3),'filled');
        xlabel('Acetate');
        ylabel('Ammonia');
        axis([-500 1000 -1000 1000]);
        subplot(7,7,23)
        scatter(FluxDataCN(4,2,1:42,1),FluxDataCN(4,2,1:42,2),50,reshape(FluxDataCNcolor(4,2,1:42,:),42,3),'filled');
        xlabel('Acetate');
        ylabel('Adenine');
        axis([-500 1000 -1000 1000]);
        subplot(7,7,24)
        scatter(FluxDataCN(4,3,:,1),FluxDataCN(4,3,:,2),50,reshape(FluxDataCNcolor(4,3,:,:),50,3),'filled');
        xlabel('Acetate');
        ylabel('Cytidine');
        axis([-500 1000 -1000 1000]);
        subplot(7,7,25)
        scatter(FluxDataCN(4,4,:,1),FluxDataCN(4,4,:,2),50,reshape(FluxDataCNcolor(4,4,:,:),50,3),'filled');
        xlabel('Acetate');
        ylabel('Putrescine');
        axis([-500 1000 -1000 1000]);
        subplot(7,7,26)
        scatter(FluxDataCN(4,5,1:49,1),FluxDataCN(4,5,1:49,2),50,reshape(FluxDataCNcolor(4,5,1:49,:),49,3),'filled');
        xlabel('Acetate');
        ylabel('Glycine');
        axis([-500 1000 -1000 1000]);
        subplot(7,7,27)
        scatter(FluxDataCN(4,6,:,1),FluxDataCN(4,6,:,2),50,reshape(FluxDataCNcolor(4,6,:,:),50,3),'filled');
        xlabel('Acetate');
        ylabel('Alanine');
        axis([-500 1000 -1000 1000]);
        subplot(7,7,28)
        scatter(FluxDataCN(4,7,:,1),FluxDataCN(4,7,:,2),50,reshape(FluxDataCNcolor(4,7,:,:),50,3),'filled');
        xlabel('Acetate');
        ylabel('Glutamine');
        axis([-500 1000 -1000 1000]);
        subplot(7,7,29)
        scatter(FluxDataCN(5,1,:,1),FluxDataCN(5,1,:,2),50,reshape(FluxDataCNcolor(5,1,:,:),50,3),'filled');
        xlabel('Ribose');
        ylabel('Ammonia');
        axis([-30 30 -1000 1000]);
        subplot(7,7,30)
        scatter(FluxDataCN(5,2,:,1),FluxDataCN(5,2,:,2),50,reshape(FluxDataCNcolor(5,2,:,:),50,3),'filled');
        xlabel('Ribose');
        ylabel('Adenine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,31)
        scatter(FluxDataCN(5,3,:,1),FluxDataCN(5,3,:,2),50,reshape(FluxDataCNcolor(5,3,:,:),50,3),'filled');
        xlabel('Ribose');
        ylabel('Cytidine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,32)
        scatter(FluxDataCN(5,4,:,1),FluxDataCN(5,4,:,2),50,reshape(FluxDataCNcolor(5,4,:,:),50,3),'filled');
        xlabel('Ribose');
        ylabel('Putrescine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,33)
        scatter(FluxDataCN(5,5,:,1),FluxDataCN(5,5,:,2),50,reshape(FluxDataCNcolor(5,5,:,:),50,3),'filled');
        xlabel('Ribose');
        ylabel('Glycine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,34)
        scatter(FluxDataCN(5,6,:,1),FluxDataCN(5,6,:,2),50,reshape(FluxDataCNcolor(5,6,:,:),50,3),'filled');
        xlabel('Ribose');
        ylabel('Alanine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,35)
        scatter(FluxDataCN(5,7,:,1),FluxDataCN(5,7,:,2),50,reshape(FluxDataCNcolor(5,7,:,:),50,3),'filled');
        xlabel('Ribose');
        ylabel('Glutamine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,36)
        scatter(FluxDataCN(6,1,:,1),FluxDataCN(6,1,:,2),50,reshape(FluxDataCNcolor(6,1,:,:),50,3),'filled');
        xlabel('Fructose');
        ylabel('Ammonia');
        axis([-30 30 -1000 1000]);
        subplot(7,7,37)
        scatter(FluxDataCN(6,2,1:49,1),FluxDataCN(6,2,1:49,2),50,reshape(FluxDataCNcolor(6,2,1:49,:),49,3),'filled');
        xlabel('Fructose');
        ylabel('Adenine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,38)
        scatter(FluxDataCN(6,3,:,1),FluxDataCN(6,3,:,2),50,reshape(FluxDataCNcolor(6,3,:,:),50,3),'filled');
        xlabel('Fructose');
        ylabel('Cytidine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,39)
        scatter(FluxDataCN(6,4,:,1),FluxDataCN(6,4,:,2),50,reshape(FluxDataCNcolor(6,4,:,:),50,3),'filled');
        xlabel('Fructose');
        ylabel('Putrescine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,40)
        scatter(FluxDataCN(6,5,:,1),FluxDataCN(6,5,:,2),50,reshape(FluxDataCNcolor(6,5,:,:),50,3),'filled');
        xlabel('Fructose');
        ylabel('Glycine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,41)
        scatter(FluxDataCN(6,6,:,1),FluxDataCN(6,6,:,2),50,reshape(FluxDataCNcolor(6,6,:,:),50,3),'filled');
        xlabel('Fructose');
        ylabel('Alanine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,42)
        scatter(FluxDataCN(6,7,:,1),FluxDataCN(6,7,:,2),50,reshape(FluxDataCNcolor(6,7,:,:),50,3),'filled');
        xlabel('Fructose');
        ylabel('Glutamine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,43)
        scatter(FluxDataCN(7,1,:,1),FluxDataCN(7,1,:,2),50,reshape(FluxDataCNcolor(7,1,:,:),50,3),'filled');
        xlabel('Sorbitol');
        ylabel('Ammonia');
        axis([-30 30 -1000 1000]);
        subplot(7,7,44)
        scatter(FluxDataCN(7,2,:,1),FluxDataCN(7,2,:,2),50,reshape(FluxDataCNcolor(7,2,:,:),50,3),'filled');
        xlabel('Sorbitol');
        ylabel('Adenine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,45)
        scatter(FluxDataCN(7,3,:,1),FluxDataCN(7,3,:,2),50,reshape(FluxDataCNcolor(7,3,:,:),50,3),'filled');
        xlabel('Sorbitol');
        ylabel('Cytidine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,46)
        scatter(FluxDataCN(7,4,:,1),FluxDataCN(7,4,:,2),50,reshape(FluxDataCNcolor(7,4,:,:),50,3),'filled');
        xlabel('Sorbitol');
        ylabel('Putrescine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,47)
        scatter(FluxDataCN(7,5,:,1),FluxDataCN(7,5,:,2),50,reshape(FluxDataCNcolor(7,5,:,:),50,3),'filled');
        xlabel('Sorbitol');
        ylabel('Glycine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,48)
        scatter(FluxDataCN(7,6,:,1),FluxDataCN(7,6,:,2),50,reshape(FluxDataCNcolor(7,6,:,:),50,3),'filled');
        xlabel('Sorbitol');
        ylabel('Alanine');
        axis([-30 30 -1000 1000]);
        subplot(7,7,49)
        scatter(FluxDataCN(7,7,:,1),FluxDataCN(7,7,:,2),50,reshape(FluxDataCNcolor(7,7,:,:),50,3),'filled');
        xlabel('Sorbitol');
        ylabel('Glutamine');
        axis([-30 30 -1000 1000]);
        pause;
        %set(gcf, 'PaperSize', [15 9]); %Keep the paper size [width height]
        print -r450 -dpdf test