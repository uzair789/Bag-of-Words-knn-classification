function [h] = getImageFeatures(wordMap,dictionarySize)
%load('dictionary.mat','dictionary','filterBank');
%load ('sun_acwjdupvyjsugpay.mat');
[s1,s2]=size(wordMap);
%figure;
T= reshape(wordMap,[1,s1*s2]);
%[n,x]=hist(T,dictionarySize);%size(dictionary,1));
n=hist(T,dictionarySize);%size(dictionary,1));

%bar(x,n/sum(n),1); 
%ylabel('normalized histogram');
h=n/sum(n);%normalizaion
end
