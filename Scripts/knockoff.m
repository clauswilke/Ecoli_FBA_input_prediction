close all
clear all
clc

load mapIDsMatFile.mat
load Replicates_Noise\GrowthIDS.mat

[tf,loc]=ismember(mapIDs,UGrowthIDs);
idx=[1:length(mapIDs)];
idx=idx(tf);
idx=idx(loc(tf));

%csvwrite('Replicates_Noise/KnockOffIDS.csv',idx');

 load iAF1260
iAF1260.rxnNames(UGrowthIDs(89))