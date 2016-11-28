function [filterBank,dictionary,B] = getFilterBankAndDictionary(trainFiles)
%{
clc;
clear all;
load('traintest.mat');
imageDir = '../images'; %where all images are located
targetDir = '../wordmap';%where we will store visual word outputs 


% give the absolute path
trainImagePaths = cellfun(@(x)(fullfile(imageDir,x)),trainImagePaths,'uniformoutput',false);
trainFiles = trainImagePaths;
%}

[filterBank] = createFilterBank();

alpha=100;
K=150;

for i=1:length(trainFiles)
     A = imread(trainFiles{i});
     s=size(A);
    %numel(A)
    D = reshape(A, s(1)*s(2), 3); 
    E=D(1:alpha,:);%find a random way of getting 100 pixels
    F=reshape(E,10,10,3);
   
    %rand_pixels = randperm(s(1)*s(2),alpha);
    
    [filterResponses] = extractFilterResponses(F,filterBank);
    if i==1
         
        B = filterResponses;
    else
        
        B = [B; filterResponses];
    end
end
 
[unused,dictionary] = kmeans(B, K, 'EmptyAction', 'drop');
end
