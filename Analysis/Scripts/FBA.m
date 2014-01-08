% Using 10 each of carbon and nitrogen sources and doing a 10-fold
% replication to see if we can predict the combination of these sources.

close all
clear all
clc

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

Carbon_Exchange_List={'EX_glc(e)','EX_pyr(e)','EX_glyc(e)','EX_ac(e)','EX_rib_D(e)','EX_fru(e)','EX_sbt_D(e)','EX_gal(e)','EX_lcts(e)','EX_man(e)'};
Nitrogen_Exchange_List={'EX_nh4(e)','EX_ade(e)','EX_cytd(e)','EX_ptrc(e)','EX_gly(e)','EX_ala_L(e)','EX_gln_L(e)','EX_arg_L(e)','EX_gam(e)','EX_4abut(e)'};

% Read e. coli model from BiGG website & save for future use.
% From next time, just load iAF1260Model to use iAF1260_model.

iAF1260_model = readCbModel('C:\Users\vis\Documents\MATLAB\iAF1260-SBML.xml');
save iAF1260Model iAF1260_model;

% Read e. coli map from BiGG website, I used both entire pathway map as
% well as just for central metabolism.

%iAF1260_map = readCbMap('C:\Users\vis\Documents\MATLAB\CentralMetabolism.txt');
iAF1260_map = readCbMap('C:\Users\vis\Documents\MATLAB\EntireMetabolism.txt');
save iAF1260Map iAF1260_map;

% By default some sources lower bound is set below zero to allow for
% uptake. We kept these as they are EXCEPT for 2 carbon and 1 nitrogen
% source.

iAF1260_model.lb(774)=0;%Carbon Source
iAF1260_model.lb(849)=0;%Carbon Source
iAF1260_model.lb(926)=0;%Nitrogen Source

%Solver type needed for optimizeCbModel
changeCobraSolver('glpk')

% Test for growth with individual sources:

% % for i=1:10
% % iAF1260_model=changeRxnBounds(iAF1260_model,Carbon_Exchange_List(i),-20,'l');
% % [reaction_flux, status]=FBA(iAF1260_model.S, iAF1260_model.lb,iAF1260_model.ub,iAF1260_model.c,1);
% % iAF1260_model=changeRxnBounds(iAF1260_model,Carbon_Exchange_List(i),0,'l');
% % disp(status)
% % disp(reaction_flux(1005))
% % end
% % 
% % for i=1:10
% % iAF1260_model=changeRxnBounds(iAF1260_model,Nitrogen_Exchange_List(i),-20,'l');
% % [reaction_flux, status]=FBA(iAF1260_model.S, iAF1260_model.lb,iAF1260_model.ub,iAF1260_model.c,1);
% % iAF1260_model=changeRxnBounds(iAF1260_model,Nitrogen_Exchange_List(i),0,'l');
% % disp(status)
% % disp(reaction_flux(1005))
% % end

% Let's iterate through 10-fold replicates and 10 carbon and 10 nitrogen
% sources to generate 1000 observations and record FBA flux results only if status  = 5.


%Let's consider all possible sources as noise sources (174 carbon and 78
%nitrogen sources) from Feist et. al.
GrowthData=tdfread('C:\Users\vis\Documents\MATLAB\Sources1.txt','tab'); %Load possible sources

% To increase the VARYING NOISE LEVELS, lets put these random sources
% within the innermost loop i.e., Replicates { Carbon { Nitrogen .. Noise
% ..

Noise_Levels=[1,3,5,10,30];
FluxData=zeros(10000,2385); % 2382 reactions and 2 IDs (CN)
counter_designs=1;
for replicates = 1:100
    for C_i=1:10
        iAF1260_model=changeRxnBounds(iAF1260_model,Carbon_Exchange_List(C_i),-20,'l');
        for N_i=1:10
            iAF1260_model=changeRxnBounds(iAF1260_model,Nitrogen_Exchange_List(N_i),-20,'l');
            
            

            rnC_i=randperm(174,10);
    
            for rnC=1:10
                rncs=cellstr(GrowthData.Carbon(rnC_i(rnC),:));
                if(strcmp(rncs,Carbon_Exchange_List(C_i))==0)
                    iAF1260_model=changeRxnBounds(iAF1260_model,rncs,-0.2,'l');
                else
                    %disp('Same Carbon Noise source as Original - so skipping!');
                    %disp(rncs);
                    %disp(Carbon_Exchange_List(C_i));
                    iAF1260_model=changeRxnBounds(iAF1260_model,rncs,-20.2,'l');
                end
            end
    
            rnN_i=randperm(78,10);
            
            for rnN=1:10
                rnns=cellstr(GrowthData.Nitrogen(rnN_i(rnN),:));
                if(strcmp(rnns,Nitrogen_Exchange_List(N_i))==0)
                    iAF1260_model=changeRxnBounds(iAF1260_model,rnns,-0.2,'l');
                else
                    %disp('Same Nitrogen Noise source as Original - so skipping!');
                    %disp(rnns);
                    %disp(Nitrogen_Exchange_List(N_i));
                    iAF1260_model=changeRxnBounds(iAF1260_model,rnns,-20.2,'l');%This
                    %is uncommented for the original dataset, here the idea
                    %is if the same ID shows up as picked up randomly, we
                    %just increase the uptake by 0.2, so change 20 to 20.2!
                   
                end
            end
    
            %counter_designs=counter_designs+1;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%% Using Segre's lab FBA.%%%%%%%%%%%%
            %[reaction_flux, status]=FBA(iAF1260_model.S, iAF1260_model.lb,iAF1260_model.ub,iAF1260_model.c,1);
            %if(status==5 & reaction_flux(1005)>0)
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            [Output_optimizeCbModel]=optimizeCbModel(iAF1260);
            reaction_flux=Output_optimizeCbModel.x;
            if(Output_optimizeCbModel.stat==1)
                
                counter_designs=counter_designs+1;
                id_flux=[reaction_flux' C_i N_i ((10*C_i) + N_i - 1)];
                FluxData(counter_designs,:)=id_flux;
            end
        clear Output_optimizeCbModel;
        clear reaction_flux;
        clear id_flux;
            for rnC=1:10
                rncs=cellstr(GrowthData.Carbon(rnC_i(rnC),:));
                %if(strcmp(rncs,Carbon_Exchange_List(C_i))==0)
                    iAF1260_model=changeRxnBounds(iAF1260_model,rncs,0,'l');
                %end
            end
    
            for rnN=1:10
                rnns=cellstr(GrowthData.Nitrogen(rnN_i(rnN),:));
                %if(strcmp(rnns,Nitrogen_Exchange_List(N_i))==0)
                    iAF1260_model=changeRxnBounds(iAF1260_model,rnns,0,'l');
                %end
            end
    
    
            iAF1260_model=changeRxnBounds(iAF1260_model,Nitrogen_Exchange_List(N_i),0,'l');
        end % Nitrogen sources
        iAF1260_model=changeRxnBounds(iAF1260_model,Carbon_Exchange_List(C_i),0,'l');
    end % Carbon Sources
    map_replicates(replicates)=counter_designs;
end % Replicates

save FluxData10Sources100Replicates FluxData;
save FluxData10Sources100Replicates FluxData;



