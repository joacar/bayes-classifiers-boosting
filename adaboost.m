function [mu, sigma, p, alpha, classes] = adaboost( data, t )
%ADABOOST Summary of this function goes here
%   Detailed explanation goes here
%
%
%
%
class = data(:,end);
classes = unique(class);
c = length(classes);
[m, n] = size(data(:,1:end-1));

% Pre allocate return variables
alpha = zeros(t, 1);
p = zeros(t,c);
mu = zeros(t, c, n);
sigma = zeros(t, c, n);

% Optional ?
error = zeros(t, 1);

% Initiate default weight wector
w = zeros(m, t+1);
w(:,1) = ones(m,1) ./ m;

% Call bayes_weight repeatedly
for i=1:t
    % Use the new adjusted weights as input
    w_ = w(:,i);
    for j=1:c
        index = find(class == classes(j));
        w_ = w_(index);
        
        % Calculate the hypothesis and prior using new w_
        [mu_, sigma_] = bayes_weight(data, w_);
        p_ = prior(data, w);
        p(t, c) = p_(c);
        
        % Compute the error with respect to w
        delta = 
        e = 1 - w_'*delta(index);

        a = 0.5*ln( (1-e) / e );

        w(:,i+1) = w_(index) ./ Z;
        if 1 == 1
            w(:,i+1) = exp(a);
        else
            w(:,i+1) = exp(-a);
        end

    end

        mu(i,:,:) = mu_;
        sigma(i,:,:) = sigma_;

        error(i, 1) = e;
        alpha(i, 1) = a;
end


end

