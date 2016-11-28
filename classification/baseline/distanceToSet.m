function [histInter] = distanceToSet(wordHist, histograms)
    
   % c=zeros(size(wordHist,1),1);
    histInter=zeros(1,size(histograms,2));
    
    for t=1:size(histograms,2)
        histInter(t)=sum(bsxfun(@min,wordHist,histograms(:,t)));
    end

end
