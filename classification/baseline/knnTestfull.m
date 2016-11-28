%function [predictedLabel,labelNo] = knnClassify(wordHist,trainHistograms,trainImageLabels,k)
%
%%
load('traintest.mat');
load('trainOutput.mat');
load('dictionary.mat');

%%
image = imread(fullfile(imageDir, testImagePaths{1}));
wordMap = getVisualWords(image, filterBank, dictionary);
[wordHist] = getImageFeaturesSPM( 3, wordMap, size(dictionary,1));

%%

distances = distanceToSet(wordHist, trainHistograms)
[~,nnI] = max(distances)
load('traintest.mat','classnames');
labelNo=trainImageLabels(nnI)
guessedImage = classnames{trainImageLabels(nnI)};
predictedLabel=guessedImage;
%fprintf('[My Guess]:%s.\n',guessedImage);
%toc;
%}
%%
%{
load('traintest.mat');
load('trainOutput.mat');
load('dictionary.mat');
l = length(testImagePaths);
tic;
%for i=1:l
    
image = imread(fullfile(imageDir, testImagePaths{1}));
wordMap = getVisualWords(image, filterBank, dictionary);
[wordHist] = getImageFeaturesSPM( 3, wordMap, size(dictionary,1));
mdl=fitcknn(wordHist,classnames);
%end
%%%%%we are using only max value. instead view the max 4 values and see the
%%%%%distances and the classes
%}
%arrange the distances in decreasing order