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

% [M, N] = size(data);
% c = ones(M, 1);    % Pre-allocate space for c
% 
% %c_t = ones(length(classes), 1);
% c_t = zeros(M,2);
% for t=1:T
%     p_ = p(t,:);
%     g = discriminant(data, mu(:,:,t), sigma(:,:,t), p_);
%     [~, class_ ] = max(g, [], 2);
%     class_ = class_ - 1;
% end
% for i=1:length(classes)
%     delta = find(class_ == classes(i));
%     c_t(i,1) = c_t(i,1) + sum(alpha(t,1) * delta);
% end
% c(m,1) = max(c_t,[],1);
% 
% end


%function g  = discriminant(data, mu, sigma, p)

% data - MxN matrix
% mu   - CxN
% sigma- CxN
% g    - MxC
% c    - Mx1

N = size(data, 2);   % N - antal dimensioner
M = size(data,1);  % M - antal datapunkter
C = size(sigma, 1);% C - antal klasser

tempC = zeros(M,C);

for i = 1:T
    g  = discriminant(data, mu(:,:,i), sigma(:,:,i), p(i,:));
    [~, class] = max(g, [], 2);
    class = class - 1;
    
    for j = 1:C
        tempC(:,j) = tempC(:,j) + alpha(i)*delta(class, classes(j));
    end
end

[~, c] = max(tempC, [], 2);
c = c - 1;