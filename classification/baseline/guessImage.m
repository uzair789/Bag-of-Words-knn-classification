function guessedImage = guessImage( imageName )
% Ishan Misra
% CV Fall 2014 - Provided Code
% Given a path to a scene image, guess what scene it is
% Input:
%   imageName - path to the image
tic;
load('trainOutput.mat');
fprintf('[Loading..]\n');
image = imread(imageName);
figure;
imshow(image);
fprintf('[Getting Visual Words..]\n');
wordMap = getVisualWords(image, filterBank, dictionary);
%%
figure;
imshow(uint8(wordMap));

%%
h = getImageFeaturesSPM( 3, wordMap, size(dictionary,1));
distances = distanceToSet(h, trainHistograms);
[~,nnI] = max(distances);
load('traintest.mat','classnames');
guessedImage = classnames{trainImageLabels(nnI)};
fprintf('[My Guess]:%s.\n',guessedImage);
toc;
end

