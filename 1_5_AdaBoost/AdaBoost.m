% EECE 5870 Machine Learning
% Fall 2018
% Homework 1
% Question 5: AdaBoost
%
% Implement the AdaBoost algorithm using a decision stump as the weak classifier.
%
% Obtain the learning curves (accuracy vs. training data size).
% 
% John Hattas
% October 4, 2018

%% Importing data
clear; clc;
bupa = importdata('data_bupa.mat');
X = bupa.X;
Y = bupa.Y; % {-1, 1}

%% AdaBoost
nIterations = 100;
h = DecisionStump.empty(nIterations, 0);
alpha = zeros(nIterations, 1);

N = size(X, 1);
D = ones(N, 1) / N; % importance vector starts as all equal

for t = 1:nIterations
    h(t) = DecisionStump();

    h(t) = h(t).fit(X, Y, D);
    Yhat = h(t).predict(X);
    
    epsilon = classificationError(Y, Yhat, D);
    alpha(t) = 1/2 * log((1 - epsilon) / epsilon);

    D = D .* exp(-alpha(t) * Y .* Yhat);
    D = D / sum(D);
    
    if t <= 10
        fprintf('t=%-2d\tj=%d\tc=%.1f\tC1=%+d\tC2=%+d\n',t,h(t).j,h(t).c,h(t).C1,h(t).C2)
    end
end

H = zeros(N, 1);
for t = 1:nIterations
    H = H + alpha(t) * h(t).predict(X);
end
H = sign(H);
accuracy = mean(H == Y)


