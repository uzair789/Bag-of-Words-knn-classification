% Ishan Misra
% CV Fall 2014 - Provided Code
%main script to train your system.
%for debugging, comment out function calls that you have run already

load('traintest.mat');
imageDir = '../images'; %where all images are located
targetDir = '../wordmap';%where we will store visual word outputs 
load('dictionary.mat','dictionary','filterBank');

%{
%%compute filter responses and make dictionary
fprintf('Computing dictionary ... ');
computeDictionary(trainImagePaths,imageDir);
load('dictionary.mat','dictionary','filterBank');
fprintf('done\n');

%%now compute visual words for each image
numCores = 4; %number of parallel jobs to run. Laptops may not support higher numbers
fprintf('Computing visual words ... ');
batchToVisualWords(trainImagePaths,classnames,filterBank,dictionary,imageDir,targetDir,numCores);
fprintf('done\n');
%}
%%now compute histograms for all training images using visual word files
tic;
trainingHistogramsFile = fullfile(targetDir,'trainingHistograms.mat');
dictionarySize = size(dictionary,1);
fprintf('Computing histograms ... ');
trainHistograms = createHistograms(dictionarySize,trainImagePaths,targetDir);
fprintf('done\n');
save(trainingHistogramsFile,'trainHistograms');
load(trainingHistogramsFile,'trainHistograms');


%%the test code just needs to load trainOutput.mat, so lets store it
save('trainOutput.mat','dictionary','filterBank','trainHistograms','trainImageLabels');
toc;
%}