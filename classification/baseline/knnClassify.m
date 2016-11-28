function [predictedLabel,labelNo] = knnClassify(wordHist,trainHistograms,trainingLabels,k)

distances = distanceToSet(wordHist, trainHistograms);
[~,nnI] = max(distances);
load('traintest.mat','classnames');
labelNo=trainingLabels(nnI);
guessedImage = classnames{trainingLabels(nnI)};
predictedLabel=guessedImage;

%fprintf('[My Guess]:%s.\n',guessedImage);
%toc;






%%



end
