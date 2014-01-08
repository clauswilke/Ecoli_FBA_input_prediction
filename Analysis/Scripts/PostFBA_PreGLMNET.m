%%%%%%%
% The original flux datast has ~2382 reactions, but we are not interested
% in exchange and transport reactions, so here we remove these!
close all
clear all
clc

%%%%%%%%%%%%%%%%%
load Replicates_Noise\FluxData49ReplicatesNoiseLevel6;
FluxData=FluxData1;
clear FluxData1;
iAF1260_model = readCbModel('C:\Users\vis\Documents\MATLAB\iAF1260-SBML.xml');
load Replicates_Noise\FluxData49ReplicatesONLYNoiseLevel6;
Threshold=0.558;%mean(FluxData1(:,1005))+3*std(FluxData1(:,1005))%This is from FluxData10SourcesNoise.mat file using 0 for carbon and nitrogen sources, but -0.2 for noise. (mean + 3*std)
clear FluxData1;
%%%%save iAF1260Model iAF1260_model;
%load iAF1260Model; % use iAF1260_model;
%%%%%%%%%%%%%%%%%%
FluxDataThresholdID=find(FluxData(:,1005)>Threshold);
FluxDataThreshold=FluxData(FluxDataThresholdID,:);
sizeFD=size(FluxDataThreshold);
%%%%%%%%%%%%%%%%%%
%%%% Add code for removing fluxes that are related to transport
transportID=[];
%%%% Reaction Names %%%%
reactionNames=[];
for i=1:sizeFD(2)-3
reactionNames=[reactionNames;iAF1260_model.rxnNames(i)];
end
%%%%%%%%%%%%%%%%%%%%%%%
for i=1:sizeFD(2)-3
if(strfind(reactionNames{i},'transport')>0)
transportID=[transportID i];
end
end

for i=1:sizeFD(2)-3
if(strfind(reactionNames{i},'exchange')>0)
transportID=[transportID i];
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
transportID=unique(transportID); % Some reactions are common to transport and exchange, just making sure there are NO repeats.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FluxDataThresholdT=FluxDataThreshold';
FluxDataThresholdNoTransportT = FluxDataThresholdT(~ismember(1:size(FluxDataThresholdT, 1), transportID), :);
FluxDataThresholdNoTransport=FluxDataThresholdNoTransportT';
%%%%
% Map missing reactions carefully for future pathway mapping!
allIDs=1:sizeFD(2)-3;% -2 for removing IDs.
mapIDs=setdiff(allIDs,transportID);

save Replicates_Noise\mapIDsMatFile6a mapIDs;
csvwrite('Replicates_Noise\mapIDsMatFile6a.csv',mapIDs);
save Replicates_Noise\FluxDataThresholdNoTransportMatFile6a FluxDataThresholdNoTransport;
csvwrite('Replicates_Noise\FluxDataThresholdNoTransport6a.csv',FluxDataThresholdNoTransport);
