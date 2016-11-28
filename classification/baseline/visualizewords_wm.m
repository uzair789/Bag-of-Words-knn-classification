load('traintest.mat');
wordMapDir = '../wordmap';
imageDir = '../images';
sum=zeros(9);
avg_wordmaps=zeros(9);
tic;
%trainImagePaths = cellfun(@(x)(fullfile(imageDir,x)),trainImagePaths,'uniformoutput',false);

 for i =1:length(trainImagePaths)%iterating over all the wordmaps
   i  
   load(fullfile(wordMapDir,strrep(trainImagePaths{i},'.jpg','.mat')));
   wordmap=wordMap(1:252,1:252);
   figure;
   imshow(trainImagePaths{i});
   c=9;w=28;
   blocks = reshape(permute(reshape(wordmap, c, w, c, w), [1 3 2 4]), c, c, w * w);
    for j=size(blocks,3)
       sum = sum +blocks(:,:,j);
    end
    avg = sum/size(blocks,3)
   %{
    figure;
    imagesc(wordmap);
    figure;
    imagesc(wordMap);
    figure;
    imshow(uint8(wordmap));
    figure;
    imagesc(avg);
    pause;
    %}
    avg_wordmaps = avg_wordmaps + avg;
 end
    avg_wordmaps = avg_wordmaps/length(trainImagePaths)
   figure;
   imagesc(avg_wordmaps);
    toc;