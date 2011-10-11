function [mu, sigma, p, alpha, classes] = adaboost( data, t )
%ADABOOST Summary of this function goes here
%   Detailed explanation goes here
%
%
%
%
class = data(:,end);
classes = unique(class);
nr_classes = length(classes);
features = data(:,1:end-1); 
[m, n] = size(data);



% Pre allocate return variables
alpha = ones(t, 1);
p = ones(t, nr_classes);
mu = ones(n-1, nr_classes, t);
sigma = ones(n-1, nr_classes, t);

% Optional ?
error = zeros(t, 1);

% Initiate default weight wector
w = ones(m, 1) ./ sum(m);

% Call bayes_weight repeatedly
for i=1:t
    % Use the new adjusted weights as input
    w_ = w;
    
    % Calculate the hypothesis and prior using new weights w_
    p_ = prior(data, w_);
    [mu_, sigma_] = bayes_weight(data, w_);
    
    
    % Call the discriminant and predict the values
    g = discriminant(features, mu_, sigma_, p_);
    
    % Find the maximum of each feature
    % dummy contains the max(g(:,x), g(:,y))
    % class_ contains either x or y depending on which is greatest
    [~, class_] = max(g, [], 2);
    class_ = class_ - 1;
    
    % 1 iff correctly classified, 0 otherwise
    delta = (class_ == class);
    
    % Index of the incorrect and correct classified features
    correct = find(delta == 1);
    incorrect = find(delta == 0);
    
    % Compute the error with respect to w
    e = 1.0 - (delta' * w_);
   
    % Compute the alpha value
    a = 0.5*log( (1-e) / e );
    
    % Re-compute all the weights for w(t+1) to match the current classification
    % Z is a normalizing constant  
    w(correct) = ones(length(correct), 1) .* exp(-a);
    %Z = sum(w_(correct));
    %w(correct) = w_(correct) ./ Z;
    
    
    w(incorrect) = ones(length(incorrect), 1) .* exp(a);
    %Z = sum(w_(incorrect));
    %w(incorrect) = w_(incorrect) ./ Z;
    Z = sum(w);
    w = w ./ Z;
    
    
    % Update all the variables
    mu(:,:,i) = mu_;
    sigma(:,:,i) = sigma_;
    
    error(i, 1) = e;
    alpha(i, 1) = a;
    p(i, :) = p_;
end


end

