function [ mu, sigma ] = bayes(D)
%BAYES Computes the maximum a posteriori (MAP) given D for mu and sigma
%   Detailed explanation goes here
    
    function mu_star = mean(feature_vector, class_vector, c)
        %MEAN Computes the mean of a given vector given class c
        %   Computes the mean of the feature vector given that each xi is
        %   in class c
        mu_star = 0; 
        Mi = 0;
        for i=1:length(feature_vector)
            if (class_vector(i) == c)
                mu_star = mu_star + feature_vector(i);
                Mi = Mi + 1;
            end
        end
        mu_star = mu_star / Mi;
    end

    function sigma_star = dev(feature_vector, class_vector, mean, c)
        %DEV Computes the deviation of a given vector given class c
        %   Computes the deviation of the feature vector given that each xi
        %   is in class c.
        sigma_star = 0;
        Mi = 0;
        for i=1:length(feature_vector)
            if (class_vector(i) == c)
                sigma_star = sigma_star + (feature_vector(i) - mean)^2;
                Mi = Mi + 1;
            end
        end
        sigma_star = sqrt(sigma_star / Mi);
    end

% The last column in D is the classification c
c = D(:,end);

% The first n-1 columns in D is the feature vectors x1, ..., x(n-1)
D(:,end) = [];    % Remove the last column
x = D;

[M,N] = size(D);

mu = ones(N, N);
sigma = ones(N, N);


mu(1,1) = mean(x(:,1), c, 0);  
mu(1,2) = mean(x(:,2), c, 0);
sigma(1,1) = dev(x(:,1), c, mu(1,1), 0);
sigma(1,2) = dev(x(:,2), c, mu(1,2), 0);

mu(2,1) = mean(x(:,1), c, 1);  
mu(2,2) = mean(x(:,2), c, 1);
sigma(2,1) = dev(x(:,1), c, mu(2,1), 1);
sigma(2,2) = dev(x(:,2), c, mu(2,2), 1);

end

