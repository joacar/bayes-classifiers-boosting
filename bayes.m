function [ mu, sigma ] = bayes(D)
%BAYES Computes the maximum a posteriori (MAP) given D for mu and sigma
%   Detailed explanation goes here

[~,n_] = size(D);
% The last column in D is the classification c
c = D(:,n_);

% The first n-1 columns in D is the feature vectors x1, ..., x(n-1)
D(:,n_) = [];    % Remove the las column
x = D;

% Compute the value for mu_{in}
[i_, n_] = size(x);
mu_star = ones(i_ , n_);   % Allocate room for matrix
for row_=1:i_
    for col_=1:n_
        Mi = x(:,row_);
        temp = sum(Mi)/Mi;
        mu_star(row_, col_) = temp;
    end
end

% Compute the value for sigma_{in}
sigma_star = ones(i_ , n_);
for row_=1:i_
    for col_=1:n_
        Mi = x(:,row_);
        temp = sum((Mi-mu_star(row_ , col_))^2)/Mi;
        mu_star(row_, col_) = temp;
    end
end




    
end

