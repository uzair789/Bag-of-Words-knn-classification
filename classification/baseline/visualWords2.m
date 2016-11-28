load('traintest.mat');
wordMapDir = '../wordmap';
imageDir = '../images';
v=zeros(9);
sum_avgs=zeros(9);
tic;
%trainImagePaths = cellfun(@(x)(fullfile(imageDir,x)),trainImagePaths,'uniformoutput',false);

 for i = 1:10;%length(trainImagePaths)%iterating over all the wordmaps
   i  
   load(fullfile(wordMapDir,strrep(trainImagePaths{i},'.jpg','.mat')));
  % wordMap=imread(trainImagePaths{i}) ;
   Apad=padarray(wordMap,[4,4]);%padding the array
     inc=0;
    [u v]=size(Apad);
    mask_sum=zeros(9);
        for i=1:u-8
                i;
            for j=1:v-8
                    j;
               mask=zeros(9);

                    for x=1:9
                            x;
                        for y=1:9
                                y;
                            mask(x,y)=Apad(i+x-1,j+y-1);

                            
                            
                        end

                    end
%                     i
%                     j
               inc=inc+1;
                mask_sum = mask_sum + mask;
                   % pause;
                    
                    
            end
%             pause;
        end 
   
   %pause;
     
   avg_1_wordmap=mask_sum/(size(wordMap,1)*size(wordMap,2));
  % figure;
   %imagesc(sum_avgs);
   %figure;
  % imagesc((wordMap));
   
%    colorbar;
%pause;  
sum_avgs=sum_avgs+avg_1_wordmap;
 end
 %sum_avgs
   sum_avgss=sum_avgs/10;%length(trainImagePaths)
   %figure;
  % imshow((sum_avgs));
 %  title('sum_avgs');
   figure;
   imagesc(sum_avgss);
   title('sum_avgss');
   toc;