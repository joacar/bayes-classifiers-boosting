function [g] = discriminant( data, mu, sigma, p)
%DISCRIMINANT Computes the maximum A Posteriori (MAP) given the data
%   INPUT data = data set, a MxN matrix
%   INPUT mu = mean for data (bayes.m)
%   INPUT sigma = deviation for data (bayes.m)
%   INPUT p = prior probability (prior.m) 
%   RETURN g = a mxn matrix show what exactly?
%
%   The discriminant function computes that given a pixel, how likely is it
%   to belong to the hand image or the hand plus book image

[m, n] = size(data);
g = ones(m, n);    % Pre-allocate space for g
    
    for x=1:m
        for c=1:n
            enumerator = ( data(x,:) - mu(c,:) ).^2;
            denominator = 2*sigma(c,:).^2;
            g(x,c) = log(p(c)) - sum(log(sigma(c,:))) - sum( enumerator ./ denominator);
        end
    end
end

% Correct value for g(1,1)
% log(p(1)) - (log(sigma(1,1)) + log(sigma(1,2))) - (((feature_vector(1,1)-mu(1,1))^2 / (2*sigma(1,1)^2)) + ((feature_vector(1,2)-mu(1,2))^2 / (2*sigma(1,2)^2)))
