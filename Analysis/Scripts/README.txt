## This folder contains the scripts along with the data generated.

network_maps -> Information about iAF1260 map/model (SBML) and key-reactions identified for predicting carbon/nitrogen sources
ProcessedData -> Data obtained after multinomial regression analyses (GLMNET R Package)
RawData -> Flux observations obtained using Flux Balance Analyses (FBA, COBRA toolbox) 

FBA.m -> Script to run flux balance analysis.
PostFBA_PreGLMNET.m -> Script to remove transport reactions and filter observations below biomass threshold.
GLMNET.R -> Script to run multinomial regression analyses on different classes for which flux measurements are taken.

testplots.m -> Script to plot (1) contamination versus misclassification and (2) training data size versus misclassification plots.
resource_consumption_Carbon.m -> Scatter plot in supplementary material for Nitrogen Limiting conditions.
resrouce_consumption_Nitrogen.m -> Scatter plot in supplementary material for Carbon Limiting conditions.

mapRxns.m -> Script to map key-reactions on metabolic models.
knockoff.m -> IDs used in knocking off reactions.
heatmap.R -> Script used to draw heatmap showing actual/predicted carbon/nitrogen sources.




