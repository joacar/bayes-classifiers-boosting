function [g] = discriminant( data, mu, sigma, p)
%DISCRIMINANT Computes the Maximum A Posteriori (MAP)
%   The discriminant function computes that given a pixel, how likely is it
%   to belong to the hand imager or the hand plus book image

[M, N] = size(data);
g = ones(M, N);    % Pre-allocate space for g
    
    for x=1:M
        for c=1:N
            enumerator = ( data(x,:) - mu(c,:) );
            denominator = 2*sigma(c,:);
            g(x,c) = log(p(c)) - sum(log(sigma(c,:))) - sum( ( data(x,:) - mu(c,:) ).^2 / (2*sigma(c,:)).^2);
        end
    end
g;
end

% Correct value for g(1,1)
% log(p(1)) - (log(sigma(1,1)) + log(sigma(1,2))) - (((feature_vector(1,1)-mu(1,1))^2 / (2*sigma(1,1)^2)) + ((feature_vector(1,2)-mu(1,2))^2 / (2*sigma(1,2)^2)))
