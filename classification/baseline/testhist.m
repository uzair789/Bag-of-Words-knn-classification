 
load('dictionary.mat','dictionary','filterBank');
s = load ('sun_acwjdupvyjsugpay.mat');
[h] = getImageFeatures(s.wordMap,size(dictionary,1));