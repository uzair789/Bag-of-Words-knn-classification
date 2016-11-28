%Loading the dictionary, filters and training data
clear all;
imageDir = 'images'; %where all images are located
targetDir = 'wordmap';%where we will store visual word outputs 
load('traintest.mat');
load('trainOutput.mat');
load('dictionary.mat');
g=[];
pred_label_no=[];
%{
numCores = 4;
try
    fprintf('Closing any pools...\n');
    delete(gcp);%parpool close; 
catch ME
    disp(ME.message);
end
parpool('local',numCores);
%}
l = length(testImagePaths);
tic;
for i=1:l
    
image = imread(fullfile(imageDir, testImagePaths{i}));
wordMap = getVisualWords(image, filterBank, dictionary);
[h] = getImageFeaturesSPM( 3, wordMap, size(dictionary,1));
[labelNo] = knnTest(h,trainHistograms,trainImageLabels,1);
pred_label_no=[pred_label_no;labelNo];
%g=[g;cellstr(predictedLabel)];
disp(i);
end
save('predLabels.mat','pred_label_no')

load('predLabels.mat')
%generating the confusion matrix


aa=testImageLabels;
bb=pred_label_no;
%c=zeros(9);
%for i=1:length(aa)
   
     %c(aa(i),bb(i))= c(aa(i),bb(i))+1;%creating the confusion matrix
    
%end
c=confusionmat(aa,bb);
disp('confusion matrix');
disp(c);
accuracy=(trace(c)/sum(c(:)))*100;
acc=num2str(accuracy);
['accuracy = ' a ' %'];
toc;
