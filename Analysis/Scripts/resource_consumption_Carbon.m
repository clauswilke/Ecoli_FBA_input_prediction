close all
clear all
clc
%FluxData1
load Replicates_Noise\FluxDataCarbonNoiseLevel2.mat
FluxData1=FluxData2;
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
                    FluxDataCN(C_i,N_i,counter,:)=[FluxData1(i,C_ii(C_i)) FluxData1(i,N_ii(N_i))];
                    counter=counter+1;
                    end
                end
            end
        end
        
        figure(1)
        subplot(7,7,1)
        plot(mean(FluxDataCN(1,1,:,1)),mean(FluxDataCN(1,1,:,2)));
        subplot(7,7,2)
        plot(mean(FluxDataCN(1,2,:,1)),mean(FluxDataCN(1,2,:,2)));
        subplot(7,7,3)
        plot(mean(FluxDataCN(1,3,:,1)),mean(FluxDataCN(1,3,:,2)));
        subplot(7,7,4)
        plot(mean(FluxDataCN(1,4,:,1)),mean(FluxDataCN(1,4,:,2)));
        subplot(7,7,5)
        plot(mean(FluxDataCN(1,5,:,1)),mean(FluxDataCN(1,5,:,2)));
        subplot(7,7,6)
        plot(mean(FluxDataCN(1,6,:,1)),mean(FluxDataCN(1,6,:,2)));
        subplot(7,7,7)
        plot(mean(FluxDataCN(1,7,:,1)),mean(FluxDataCN(1,7,:,2)));
        subplot(7,7,8)
        plot(mean(FluxDataCN(2,1,:,1)),mean(FluxDataCN(2,1,:,2)));
        subplot(7,7,9)
        plot(mean(FluxDataCN(2,2,:,1)),mean(FluxDataCN(2,2,:,2)));
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
        subplot(7,7,1)
        scatter(FluxDataCN(1,1,:,1),FluxDataCN(1,1,:,2));
        xlabel('Glucose');
        ylabel('Ammonia');
        subplot(7,7,2)
        scatter(FluxDataCN(1,2,:,1),FluxDataCN(1,2,:,2));
        xlabel('Glucose');
        ylabel('Adenine');
        subplot(7,7,3)
        scatter(FluxDataCN(1,3,:,1),FluxDataCN(1,3,:,2));
        xlabel('Glucose');
        ylabel('Cytidine');
        subplot(7,7,4)
        scatter(FluxDataCN(1,4,:,1),FluxDataCN(1,4,:,2));
        xlabel('Glucose');
        ylabel('Putrescine');
        subplot(7,7,5)
        scatter(FluxDataCN(1,5,:,1),FluxDataCN(1,5,:,2));
        xlabel('Glucose');
        ylabel('Glycine');
        subplot(7,7,6)
        scatter(FluxDataCN(1,6,:,1),FluxDataCN(1,6,:,2));
        xlabel('Glucose');
        ylabel('Alanine');
        subplot(7,7,7)
        scatter(FluxDataCN(1,7,:,1),FluxDataCN(1,7,:,2));
        xlabel('Glucose');
        ylabel('Glutamine');
        subplot(7,7,8)
        scatter(FluxDataCN(2,1,:,1),FluxDataCN(2,1,:,2));
        xlabel('Pyruvate');
        ylabel('Ammonia');
        subplot(7,7,9)
        scatter(FluxDataCN(2,2,:,1),FluxDataCN(2,2,:,2));
        xlabel('Pyruvate');
        ylabel('Adenine');
        subplot(7,7,10)
        scatter(FluxDataCN(2,3,:,1),FluxDataCN(2,3,:,2));
        xlabel('Pyruvate');
        ylabel('Cytidine');
        subplot(7,7,11)
        scatter(FluxDataCN(2,4,:,1),FluxDataCN(2,4,:,2));
        xlabel('Pyruvate');
        ylabel('Putrescine');
        subplot(7,7,12)
        scatter(FluxDataCN(2,5,:,1),FluxDataCN(2,5,:,2));
        xlabel('Pyruvate');
        ylabel('Glycine');
        subplot(7,7,13)
        scatter(FluxDataCN(2,6,:,1),FluxDataCN(2,6,:,2));
        xlabel('Pyruvate');
        ylabel('Alanine');
        subplot(7,7,14)
        scatter(FluxDataCN(2,7,:,1),FluxDataCN(2,7,:,2));
        xlabel('Pyruvate');
        ylabel('Glutamine');
        subplot(7,7,15)
        scatter(FluxDataCN(3,1,:,1),FluxDataCN(3,1,:,2));
        xlabel('Glycerol');
        ylabel('Ammonia');
        subplot(7,7,16)
        scatter(FluxDataCN(3,2,:,1),FluxDataCN(3,2,:,2));
        xlabel('Glycerol');
        ylabel('Adenine');
        subplot(7,7,17)
        scatter(FluxDataCN(3,3,:,1),FluxDataCN(3,3,:,2));
        xlabel('Glycerol');
        ylabel('Cytidine');
        subplot(7,7,18)
        scatter(FluxDataCN(3,4,:,1),FluxDataCN(3,4,:,2));
        xlabel('Glycerol');
        ylabel('Putrescine');
        subplot(7,7,19)
        scatter(FluxDataCN(3,5,:,1),FluxDataCN(3,5,:,2));
        xlabel('Glycerol');
        ylabel('Glycine');
        subplot(7,7,20)
        scatter(FluxDataCN(3,6,:,1),FluxDataCN(3,6,:,2));
        xlabel('Glycerol');
        ylabel('Alanine');
        subplot(7,7,21)
        scatter(FluxDataCN(3,7,:,1),FluxDataCN(3,7,:,2));
        xlabel('Glycerol');
        ylabel('Glutamine');
        subplot(7,7,22)
        scatter(FluxDataCN(4,1,:,1),FluxDataCN(4,1,:,2));
        xlabel('Acetate');
        ylabel('Ammonia');
        subplot(7,7,23)
        scatter(FluxDataCN(4,2,:,1),FluxDataCN(4,2,:,2));
        xlabel('Acetate');
        ylabel('Adenine');
        subplot(7,7,24)
        scatter(FluxDataCN(4,3,:,1),FluxDataCN(4,3,:,2));
        xlabel('Acetate');
        ylabel('Cytidine');
        subplot(7,7,25)
        scatter(FluxDataCN(4,4,:,1),FluxDataCN(4,4,:,2));
        xlabel('Acetate');
        ylabel('Putrescine');
        subplot(7,7,26)
        scatter(FluxDataCN(4,5,:,1),FluxDataCN(4,5,:,2));
        xlabel('Acetate');
        ylabel('Glycine');
        subplot(7,7,27)
        scatter(FluxDataCN(4,6,:,1),FluxDataCN(4,6,:,2));
        xlabel('Acetate');
        ylabel('Alanine');
        subplot(7,7,28)
        scatter(FluxDataCN(4,7,:,1),FluxDataCN(4,7,:,2));
        xlabel('Acetate');
        ylabel('Glutamine');
        subplot(7,7,29)
        scatter(FluxDataCN(5,1,:,1),FluxDataCN(5,1,:,2));
        xlabel('Ribose');
        ylabel('Ammonia');
        subplot(7,7,30)
        scatter(FluxDataCN(5,2,:,1),FluxDataCN(5,2,:,2));
        xlabel('Ribose');
        ylabel('Adenine');
        subplot(7,7,31)
        scatter(FluxDataCN(5,3,:,1),FluxDataCN(5,3,:,2));
        xlabel('Ribose');
        ylabel('Cytidine');
        subplot(7,7,32)
        scatter(FluxDataCN(5,4,:,1),FluxDataCN(5,4,:,2));
        xlabel('Ribose');
        ylabel('Putrescine');
        subplot(7,7,33)
        scatter(FluxDataCN(5,5,:,1),FluxDataCN(5,5,:,2));
        xlabel('Ribose');
        ylabel('Glycine');
        subplot(7,7,34)
        scatter(FluxDataCN(5,6,:,1),FluxDataCN(5,6,:,2));
        xlabel('Ribose');
        ylabel('Alanine');
        subplot(7,7,35)
        scatter(FluxDataCN(5,7,:,1),FluxDataCN(5,7,:,2));
        xlabel('Ribose');
        ylabel('Glutamine');
        subplot(7,7,36)
        scatter(FluxDataCN(6,1,:,1),FluxDataCN(6,1,:,2));
        xlabel('Fructose');
        ylabel('Ammonia');
        subplot(7,7,37)
        scatter(FluxDataCN(6,2,:,1),FluxDataCN(6,2,:,2));
        xlabel('Fructose');
        ylabel('Adenine');
        subplot(7,7,38)
        scatter(FluxDataCN(6,3,:,1),FluxDataCN(6,3,:,2));
        xlabel('Fructose');
        ylabel('Cytidine');
        subplot(7,7,39)
        scatter(FluxDataCN(6,4,:,1),FluxDataCN(6,4,:,2));
        xlabel('Fructose');
        ylabel('Putrescine');
        subplot(7,7,40)
        scatter(FluxDataCN(6,5,:,1),FluxDataCN(6,5,:,2));
        xlabel('Fructose');
        ylabel('Glycine');
        subplot(7,7,41)
        scatter(FluxDataCN(6,6,:,1),FluxDataCN(6,6,:,2));
        xlabel('Fructose');
        ylabel('Alanine');
        subplot(7,7,42)
        scatter(FluxDataCN(6,7,:,1),FluxDataCN(6,7,:,2));
        xlabel('Fructose');
        ylabel('Glutamine');
        subplot(7,7,43)
        scatter(FluxDataCN(7,1,:,1),FluxDataCN(7,1,:,2));
        xlabel('Sorbitol');
        ylabel('Ammonia');
        subplot(7,7,44)
        scatter(FluxDataCN(7,2,:,1),FluxDataCN(7,2,:,2));
        xlabel('Sorbitol');
        ylabel('Adenine');
        subplot(7,7,45)
        scatter(FluxDataCN(7,3,:,1),FluxDataCN(7,3,:,2));
        xlabel('Sorbitol');
        ylabel('Cytidine');
        subplot(7,7,46)
        scatter(FluxDataCN(7,4,:,1),FluxDataCN(7,4,:,2));
        xlabel('Sorbitol');
        ylabel('Putrescine');
        subplot(7,7,47)
        scatter(FluxDataCN(7,5,:,1),FluxDataCN(7,5,:,2));
        xlabel('Sorbitol');
        ylabel('Glycine');
        subplot(7,7,48)
        scatter(FluxDataCN(7,6,:,1),FluxDataCN(7,6,:,2));
        xlabel('Sorbitol');
        ylabel('Alanine');
        subplot(7,7,49)
        scatter(FluxDataCN(7,7,:,1),FluxDataCN(7,7,:,2));
        xlabel('Sorbitol');
        ylabel('Glutamine');
        
        
        
        