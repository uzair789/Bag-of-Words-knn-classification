function outputHistograms = createHistograms(dictionarySize,imagePaths,wordMapDir)
%code to compute histograms of all images from the visual words
%imagePaths: a cell array containing paths of the images
%wordMapDir: directory name which contains all the wordmaps

outputHistograms = []; %create a NumImage x histogram matrix of histograms.
                      %this variable will store all the histograms of training images
layerNum = 3;

    for i = 1:length(imagePaths)
      % wordMapDir
      % imagePaths
      % strrep(imagePaths{i},'.jpg','.mat')
       load(fullfile(wordMapDir,strrep(imagePaths{i},'.jpg','.mat')));
        
                      
        h = getImageFeaturesSPM(layerNum, wordMap, dictionarySize);

        outputHistograms = [outputHistograms h];
    end

end
