%Loading the dictionary, filters and training data

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
[predictedLabel,labelNo] = knnClassify(h,trainHistograms,trainImageLabels,1);
pred_label_no=[pred_label_no;labelNo];
g=[g;cellstr(predictedLabel)];
disp(i);
end
save('predLabels.mat','g')

load('predLabels.mat')
%generating the confusion matrix


aa=testImageLabels;
bb=pred_label_no;
c=zeros(9);
for i=1:length(aa)
   
     c(aa(i),bb(i))= c(aa(i),bb(i))+1;
    
end
disp('confusion matrix');
disp(c);
accuracy=(trace(c)/sum(c(:)))*100;
disp('accuracy=');
disp(accuracy);
disp('%');
c=[classnames{2} c(2,:)]

%{
fprintf('Closing the pool\n');
parpool close
%}