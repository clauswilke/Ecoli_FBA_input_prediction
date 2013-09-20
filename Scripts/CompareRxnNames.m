GrowthIDnames = importdata('CNSources.csv');

iAF1260_model = readCbModel('C:\Users\vis\Documents\MATLAB\iAF1260-SBML.xml');
save iAF1260Model iAF1260_model;

GrowthIDs=[];
for i=1:length(GrowthIDnames)
GrowthIDs = [GrowthIDs; find(ismember(iAF1260_model.rxnNames,GrowthIDnames(i)))];
end
UGrowthIDs=unique(GrowthIDs)

save Replicates_Noise/GrowthIDS UGrowthIDs;
csvwrite('Replicates_Noise/GrowthIDS.csv',UGrowthIDs);
