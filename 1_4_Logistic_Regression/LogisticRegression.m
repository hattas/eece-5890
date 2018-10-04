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
bc = importdata('data_breastcancer.mat');

%% User parameters
eta = 10e-5;
lambda = 0;
maxIter = 1000;

%% Random split testing
%split = [.01 .02 .03 .125 .625 1];
split = logspace(-2, 0, 20);
nRandomSplits = 5;
accuracy = zeros(length(split), nRandomSplits);
for i = 1:length(split)
    for j = 1:nRandomSplits
        [X, Y] = randomizeOrder(bc.X, bc.Y);
        [xTrain, yTrain, xTest, yTest] = splitData(X, Y, 2/3);
        nTrainPoints = round(size(xTrain, 1)*split(i));
        xTrain = xTrain(1:nTrainPoints, :);
        yTrain = yTrain(1:nTrainPoints, :);
        w = getWeights(xTrain, yTrain, eta, lambda, maxIter);
        p = predict(w, xTest);
        accuracy(i,j) = mean(p == yTest);
    end
end
accuracy = mean(accuracy, 2);

%% Plot the learning curve
plot(split, accuracy, '-r.', 'linewidth', 1, 'markersize', 15);
title('Learning Curve')
xlabel('Portion of data used')
ylabel('Test accuracy')



