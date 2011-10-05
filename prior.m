function [p] = prior(data,w)
%PRIOR This function computes the prior class probabilities
%   INPUT   data = data set with last column containing the classes
%   INPUT   w = weight vector for weighting training instances (optional)
%   RETURN  p = probability that a feature in data(:,end-1) belongs to
%   class c

[m,n] = size(data);
% If only one input argument, set w to one
if (nargin==1)
  w=ones(m,1);
end

classes = unique(data(:,n));
for i=1:length(classes)
  index=find(data(:,n)==classes(i));
  p(i)=sum(w(index));
end
p=p/sum(w);