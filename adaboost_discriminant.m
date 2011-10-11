function [c] = adaboost_discriminant( data, mu, sigma, p, alpha, classes, T)
%DISCRIMINANT Computes the maximum A Posteriori (MAP) given the data
%   INPUT data = data set, a MxN matrix
%   INPUT mu = mean for data (bayes_weight.m)
%   INPUT sigma = deviation for data (bayes_weight.m)
%   INPUT p = prior probability (prior.m using weights)
%   INPUT alpha = 
%   INPUT classes =
%   INPUT t =
%   RETURN c = a mx1 vector
%
%   The discriminant function computes that given a pixel, how likely is it
%   to belong to the hand image or the hand plus book image

[M, N] = size(data);
c = ones(M, 1);    % Pre-allocate space for c

for m=1:M
    
    c_t = ones(length(classes), 1);
    for t=1:T
    p_ = p(t,:);
    g = discriminant(data, mu(:,:,t), sigma(:,:,t), p_);
    [~, class_ ] = max(g, [], 2);
    class_ = class_ - 1;
    
    for i=1:length(classes)
        delta = (class_ == classes(i));
        c_t(i,1) = alpha .* delta;
    end
    c(m,1) = max(c_t);
    end
end


end