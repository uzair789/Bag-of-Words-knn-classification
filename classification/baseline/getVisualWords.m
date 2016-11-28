function [wordMat]=getVisualWords(I,filterBank,dictionary)
  % load('dictionary.mat','dictionary','filterBank');
   % I = imread('sun_auobqtwkewdqrpec.jpg');
    %figure;
    %imshow(I)
    s=size(I);
    Mat=zeros(1,s(1)*s(2));
    d=size(dictionary);
    [filterResponses] = extractFilterResponses(I,filterBank);
    %tic;
   %{
    for j = 1:s(1)*s(2)%iterating over all the pixels
    
             X = [filterResponses(j,:); dictionary];
             DD = pdist(X);
             D = DD(1,1:150);
             cluster_val = find(D == min(D));
             Mat(1,j)=cluster_val;
             %Mat(1,j,2)=0;%cluster_val*255/300;
             %Mat(1,j,3)=0;%;cluster_val*255/300;
            
    end
 %}
    
   D=pdist2(filterResponses,dictionary);
   for j=1:size(D,1)
      cluster_val=find(D(j,:)==min(D(j,:)));
      Mat(1,j)=cluster_val;
   end
   wordMat = reshape(Mat,s(1),s(2));
   %figure;
  % imshow(uint8(wordMat));
end
%toc;
