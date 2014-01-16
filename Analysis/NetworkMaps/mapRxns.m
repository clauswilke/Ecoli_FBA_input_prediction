% Carbon Sources
% % D-glucose - 'D-Glucose exchange' - 'EX_glc(e)' - 849
% % pyruvate - 'Pyruvate exchange' - 'EX_pyr(e)' - 955
% % glycerol - 'Glycerol exchange'  - 'EX_glyc(e)' - 861
% % acetate - 'Acetate exchange' - 'EX_ac(e)' - 729
% % D-ribose - 'D-Ribose exchange' - 'EX_rib_D(e)' - 957
% % D-fructose - 'D-Fructose exchange' - 'EX_fru(e)' - 825
% % D-sorbitol - 'D-Sorbitol exchange' - 'EX_sbt_D(e)' - 959
% Nitrogen Sources
% % ammonia - 'Ammonia exchange' - 'EX_nh4(e)' - 926
% % adenine - 'Adenine exchange' - 'EX_ade(e)' - 741
% % cytidine - 'Cytidine exchange' - 'EX_cytd(e)' - 787
% % putrescine - 'Putrescine exchange' - 'EX_ptrc(e)' - 954
% % L-glycine - 'Glycine exchange' - 'EX_gly(e)' - 856
% % L-alanine - 'L-Alanine exchange' - 'EX_ala_L(e)' - 749
% % L-glutamine  - 'L-Glutamine exchange' -  'EX_gln_L(e)' - 854


close all
%clear all
clc
% Load all files
load extra_files/mapIdsMatFile1.mat
load extra_files/C1IDs.mat
load extra_files/C2IDs.mat
load extra_files/C3IDs.mat
load extra_files/C4IDs.mat
load extra_files/C5IDs.mat
load extra_files/C6IDs.mat
load extra_files/C7IDs.mat
load extra_files/N1IDs.mat
load extra_files/N2IDs.mat
load extra_files/N3IDs.mat
load extra_files/N4IDs.mat
load extra_files/N5IDs.mat
load extra_files/N6IDs.mat
load extra_files/N7IDs.mat

map = readCbMap('extra_files/CentralMetabolism.txt');
%model = readCbModel('extra_files/iAF1260-SBML.xml');

rxn_num = size(map.connectionName, 1);
mol_num = size(map.molName, 1);

map.shapeColor = repmat([210 210 210], size(map.shapeColor, 1), 1);
map.shapeThickness = repmat(10, size(map.shapeColor, 1), 1);
map.molPrime = cell(mol_num, 1);
map.molPrime(1:mol_num) = {'Y'};

% Adjust position of bottom right squares
map.shapePos(2, 1) = map.shapePos(1, 1) + (map.shapeSize(1,2)-map.shapeSize(2,2))/2;
map.shapePos(2, 2) = map.shapePos(1, 2) + (map.shapeSize(1,1)-map.shapeSize(2,1))/2;

% Adjust the position of the middle right squares
map.shapePos(4, 1) = map.shapePos(3, 1) + (map.shapeSize(3,2)-map.shapeSize(4,2))/2;
map.shapePos(4, 2) = map.shapePos(3, 2) + (map.shapeSize(3,1)-map.shapeSize(4,1))/2;

% Adjust the position of the left squares
map.shapePos(7, 1) = map.shapePos(5, 1) + (map.shapeSize(5,2)-map.shapeSize(7,2))/2;
map.shapePos(7, 2) = map.shapePos(5, 2) + (map.shapeSize(5,1)-map.shapeSize(7,1))/2;

% Adjust the position of the left squares
map.shapePos(8, 1) = map.shapePos(6, 1) + (map.shapeSize(6,2)-map.shapeSize(8,2))/2;
map.shapePos(8, 2) = map.shapePos(6, 2) + (map.shapeSize(6,1)-map.shapeSize(8,1))/2;

text_size = zeros(size(map.molIndex,1),1); 
node_weights = repmat(20, size(map.molIndex,1), 1);
node_colors = repmat([135 135 135],size(map.molIndex,1),1);
edge_weights = repmat(25, rxn_num, 1);

changeCbMapOutput('svg');

reactions         = repmat([200 200 200], size(model.rxns,1), 1);
options.edgeColor = repmat([200 200 200], size(map.connectionName,1), 1);

b = mapIDs(C4withoutTransportIDs(:,1));

reactions(b, :)=repmat([255 0 0], size(b, 2), 1);

[known index] = ismember(map.connectionAbb,model.rxns);
index = index(index~=0);

options.edgeColor(known,:) = reactions(index,:);
%map.connectionAbb(known, :) = model.rxnNames(index, :);

b = find(options.edgeColor(:,1)==255);
last_reactions = map.connection(b, :);
map.connection(b, :) = [];
options.edgeColor(b, :) = [];
map.connection = transpose([transpose(map.connection) transpose(last_reactions)]);

options.edgeColor = transpose([transpose(options.edgeColor) transpose(repmat([255 0 0], size(b, 1), 1))]);

options.edgeWeight = edge_weights;
options.nodeWeight = node_weights;
options.nodeColor = node_colors;

map.connectionAbb = cell(rxn_num, 1);

new_text = transpose({'Menaquinone Redox',...
                      'DMQ Redox',... 
                      'Ubiquinone Redox'...
                      'TCA Cycle',...
                      'Glycolysis'});
                  
%text_positions = find(ismember(map.text,new_text));

map.text = new_text;
map.textPos = [7000 2355; 7030 4145; 7050 400; 3700 3370; 1800 2300];
map.textFont = cellstr(repmat('Helvetica', size(map.text), 1));
map.textSize = repmat(40, size(map.text), 1);

drawCbMap(map, options, 'FileName', 'EcoreOptFlux2.svg');



