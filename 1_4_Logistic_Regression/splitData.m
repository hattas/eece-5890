function [xTrain, xTest, yTrain, yTest] = splitData(X, Y, split, trainRatio)
    X = datasample(X, round(split*size(X,1)));
    n = size(X,1);
    tf = false(n, 1);
    tf(1:round(trainRatio * n)) = true;
    tf = tf(randperm(n));
    xTrain = X(tf,:);
    xTest = X(~tf,:);
    yTrain = Y(tf);
    yTest = Y(~tf);
end