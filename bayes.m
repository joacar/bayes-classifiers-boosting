function [ mu, sigma ] = bayes(D)
%BAYES Computes the mean (mu) and deviation (sigma) for D
%   INPUT data matrix D(MxN) 
%   RETURN [mu, sigma]
%   The first n-1 columns of D is the feature vector (x) and the n:th column
%   is the class vector (c). This function computes mu and sigma for each of
%   the n-1 vectors based on their indicator variable (c in classes)


class = D(:,end);
% Unique classes in class (Indicator variables)
classes = unique(class); 
nr_classes = length(classes);
D(:,end) = [];  % Remove last column
[~, n] = size(D);

% Pre allocate space
mu = zeros(nr_classes , n);
sigma = zeros(nr_classes , n);

% Calculate the mean and deviation for class c in feature vector x
for c=1:nr_classes
    index = find(class == classes(c));
    for i=1:n
        x = D(:,i);
        mu(c, i) = sum(x(index)) / length(index);
        sigma(c, i) = sqrt( sum( (x(index) - mu(c,i)).^2 ) ./ length(index) );
    end
end

end