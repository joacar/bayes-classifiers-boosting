function [c] = adaboost_discriminant( data, mu, sigma, p, alpha, classes, t)
%DISCRIMINANT Computes the maximum A Posteriori (MAP) given the data
%   INPUT data = data set, a MxN matrix
%   INPUT mu = mean for data (bayes.m)
%   INPUT sigma = deviation for data (bayes.m)
%   INPUT p = prior probability (prior.m)
%   INPUT alpha = 
%   INPUT classes =
%   INPUT t =
%   RETURN c = a mx1 vector
%
%   The discriminant function computes that given a pixel, how likely is it
%   to belong to the hand image or the hand plus book image

[m, n] = size(data);
c = ones(m, 1);    % Pre-allocate space for g
    
    for x=1:m
        for c=1:n
            enumerator = ( data(x,:) - mu(c,:) ).^2;
            denominator = 2*sigma(c,:).^2;
            g(x,c) = log(p(c)) - sum(log(sigma(c,:))) - sum( enumerator ./ denominator);
        end
    end
end