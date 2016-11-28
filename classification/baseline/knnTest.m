function [predictedLabel] = knnTest(wordHist,trainHistograms,trainImageLabels,k)
%
%%
%{
clear all;

load('traintest.mat');
load('trainOutput.mat');
load('dictionary.mat');
load('traintest.mat','classnames');
imageDir = '../images'; %where all images are located

%%
image = imread(fullfile(imageDir, testImagePaths{1}));
wordMap = getVisualWords(image, filterBank, dictionary);
[wordHist] = getImageFeaturesSPM( 3, wordMap, size(dictionary,1));
k=20;
%}
%%

distances = distanceToSet(wordHist, trainHistograms);
order = sort(distances,'descend');
knn = order(1:k);%find indices of k max values from order
length(knn);
%label_Indice=[];
%labelNos=[];
for i=1:length(knn)
    %disp('***********')
    if length(find(distances==knn(i))) > 1
        dis =  find(distances==knn(i));
        label_Indice(i) = dis(1); 
    else
    %find(distances==knn(i))
    %disp('************')
    label_Indice(i) = find(distances==knn(i));
    end
  
    labelNos(i)=trainImageLabels(label_Indice(i));
    %classnames{labelNos(i)}
   
    %trainImageLabels()%indice of the values
    %guessedImage = classnames{labelNo};
    %predictedLabel=guessedImage;
    %disp('iteration value');
    i;    
   % pause;
    
end
%disp('*******');
 %   disp(labelNos);
  %  disp('*******');
    
 predictedLabel = mode(labelNos);
 end
%[~,nnI] = max(distances)
%fprintf('[My Guess]:%s.\n',guessedImage);
%toc;
%}
%%
%%%%%we are using only max value. instead view the max 4 values and see the
%%%%%distances and the classes
%}
%arrange the distances in decreasing order