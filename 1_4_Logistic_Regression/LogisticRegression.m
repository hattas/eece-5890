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
X = breastcancer.X;
Y = breastcancer.Y;
clear('breastcancer');

%% Logistic Regression
eta = 10e-5;
lambda = 1000;
maxIter = 1000;

%split = [.01 .02 .03 .125 .625 1];
split = linspace(0.1,1, 30);
nRandomSplits = 100;
accuracy = zeros(length(split), nRandomSplits);
for i = 1:length(split)
    for j = 1:nRandomSplits
        [xTrain, xTest, yTrain, yTest] = splitData(X, Y, split(i), 2/3);
        w = getWeights(xTrain, yTrain, eta, lambda, maxIter);
        p = predict(w, xTest);
        accuracy(i,j) = mean(double(p == yTest));
    end
end
accuracy = mean(accuracy, 2);
plot(split, accuracy, '-r.', 'linewidth', 1, 'markersize', 15);
title('Learning Curve')
xlabel('Portion of data used')
ylabel('Test accuracy')



