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
Y = bupa.Y;

%% Part 1:
% Display selected feature, threshold, and class label for 1st 10 iterations
nIterations = 10;
[h, alpha] = trainAdaBoost(X, Y, nIterations, 1);
H = predictAda(X, h, alpha);
accuracy = mean(H == Y)

%% Part 2
% Use 90% training & 10% testing
% Average over 50 random splits, use 100 iterations
% Plot average training error & average test error vs boosting iteration
nRandomSplits = 50;
nIterations = 100;
trainingError = zeros(nRandomSplits, nIterations);
testError = zeros(nRandomSplits, nIterations);
for i = 1:nRandomSplits
    [X, Y] = randomizeOrder(bupa.X, bupa.Y);
    [xTrain, yTrain, xTest, yTest] = splitData(X, Y, 2/3);
    [h, alpha] = trainAdaBoost(xTrain, yTrain, nIterations);
    for t = 1:nIterations
        trainingError(i, t) = mean(yTrain ~= predictAda(xTrain, h(1:t), alpha(1:t)));
        testError(i, t) = mean(yTest ~= predictAda(xTest, h(1:t), alpha(1:t)));
    end
end
avgTrainingError = mean(trainingError, 1);
avgTestError = mean(testError, 1);

plot(1:nIterations, avgTrainingError, 'linewidth', 1)
hold on
plot(1:nIterations, avgTestError, 'linewidth', 1)
xlabel('number of boosting iterations')
ylabel('average error')
legend('training', 'test')
title('Error vs. Number of Boosting Iterations')
