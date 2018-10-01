% EECE 5870 Machine Learning
% Fall 2018
% Homework 1
% Question 4: Logistic Regression
%
% Implement a logistic regression classifier with the assumption that 
% each attribute value for a particular record is independently generated.
%
% Obtain the learning curves (accuracy vs. training data size).
% 
% John Hattas
% October 4, 2018

%% Importing data
clear; clc;
breastcancer = importdata('data_breastcancer.mat');
n = breastcancer.n; % number of examples
d = breastcancer.d; % number of features
X = breastcancer.X;
Y = breastcancer.Y;
clear('breastcancer');

%% Logistic Regression
X = [ones(n, 1) X]; % add 
w = zeros(d + 1, 1); % initial weights
wprev = Inf;
eta = 0.0001;
lambda = 1000;
nIterations = 0;
norms = zeros(1000);

while norm(w - wprev) > 10e-5 && nIterations < 1000
    wprev = w;
    w = update(w, X, Y, eta, lambda);
    nIterations = nIterations + 1;
    norms(nIterations) = norm(w - wprev);
end

Norm = norm(w - wprev)
nIterations

p = predict(w, X);

fprintf('Train Accuracy: %f \n', mean(double(p == Y)));
fprintf('Fraction of positives: %f \n', nnz(Y) / length(Y));

plot(norms(1:nIterations))
ylabel('||w(t+1)-w(t)||')
xlabel('iteration')




