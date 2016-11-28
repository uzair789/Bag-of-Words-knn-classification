function [h] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize)

%{
load('dictionary.mat','dictionary','filterBank');
load ('sun_acwjdupvyjsugpay.mat');
layerNum=3;
dictionarySize=size(dictionary,1);
%}

    L=layerNum-1;
    H=[];
    [rows_wM cols_wM] = size(wordMap);
  %for layer zero  
    H = getImageFeatures(wordMap,dictionarySize);%hist of l=0
    W=2^(-L);
    H=W*H;%weight for histogram of layer 0
  %for layers 1 to l-1  
    for l = 1:L;%layerNum-1
       if l>1
        W=2^(l-L-1);
        %disp('weight incremented');
       end
       
       num_cells_1D = 2^l;%cells along column or row of the image
       % cell1 = cell(num_cells);        
        i=1;%start row     
       % r=1;%cell row
        
        while i<rows_wM
            j=1;%start column
           % s=1;%cell column
            while j<cols_wM
               % cell1{r,s} = wordMap(i:i+119,j:j+159)
               %(rows_wM/num_cells_1D)-1
               %(cols_wM/num_cells_1D)-1
                [H1] = getImageFeatures(wordMap(i:i+((rows_wM/num_cells_1D)-1),j:j+((cols_wM/num_cells_1D)-1)),dictionarySize);
                H=[H W*H1];%collecting all the histograms                
                j=j+(cols_wM/num_cells_1D);%1+160=161;
                %s=s+1;
            end    
        i=i+(rows_wM/num_cells_1D);%1+120=121
        %r=r+1;
        end
    %starts loop for the next layer
        
    end
    
    h=H';%to match the functions output variable
  %  disp('end full getFeaturesSPM once')
end
