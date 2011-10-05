function [ mu, sigma ] = bayes_weight(data, w)
%BAYES Computes the mean (mu) and deviation (sigma) for data given weight w
%   INPUT data = MxN data matrix
%   INPUT w = Mx1 vector of weights
%   RETURN [mu, sigma]
%   The first n-1 columns of data is the feature vectors and the last column
%   is the class vector. This function computes mu and sigma for each of
%   the n-1 vectors based on their indicator variable and the weights w

class = data(:,end);
% Unique classes in class (Indicator variables)
classes = unique(class); 
nr_classes = length(classes);
data(:,end) = [];  % Remove last column
[~, n] = size(data);

% Pre allocate space
mu = zeros(nr_classes , n);
sigma = zeros(nr_classes , n);

% Calculate the mean and deviation for class c in feature vector x
for c=1:nr_classes
    index = find(class == classes(c));
    for i=1:n
        x = data(:,i);
        %mu(c, i) = sum(x(index)) / length(index);
        mu(c, i) = w(index)'*x(index) / sum(w(index));
        sigma(c, i) = sqrt( sum( w(index)'*(x(index) - mu(c,i)).^2 ) ./ sum(w(index)) );
    end
end

end