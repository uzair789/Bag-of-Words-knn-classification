load('traintest.mat');
wordMapDir = '../wordmap';
imageDir = '../images';
v=zeros(9);
sum_avgs=zeros(9);
%trainImagePaths = cellfun(@(x)(fullfile(imageDir,x)),trainImagePaths,'uniformoutput',false);

 for i = 1:length(trainImagePaths)%iterating over all the wordmaps
   i  
   load(fullfile(wordMapDir,strrep(trainImagePaths{i},'.jpg','.mat')));
  %wordMap=imread(trainImagePaths{i}) ;
  wordmap=wordMap(1:63,1:63);
   c=mat2cell(wordmap,[9,9,9,9,9,9,9],[9,9,9,9,9,9,9]);
   cr=reshape(c,1,size(c,1)*size(c,2));
   for k = length(cr)
       kk=cell2mat(cr(k));
       v = v + double(kk);
   end    
   avg_1_wordmap=(1/9).*v;
   figure;
   imagesc(sum_avgs);
   figure;
   imshow(uint8(wordMap));
   figure;
   imagesc(wordMap)
   figure;
   imagesc(wordmap)
%    colorbar;
pause;  
sum_avgs=sum_avgs+avg_1_wordmap;
 end
 sum_avgs
   sum_avgss=sum_avgs/length(trainImagePaths)
   %figure;
  % imshow((sum_avgs));
 %  title('sum_avgs');
   figure;
   imagesc(sum_avgss);
   title('sum_avgss');