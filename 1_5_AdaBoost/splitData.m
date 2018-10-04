function [xTrain, yTrain, xTest, yTest] = splitData(X, Y, trainRatio)
    m = length(Y);
    tf = false(m, 1);
    tf(1:round(trainRatio * m)) = true;
    tf = tf(randperm(m));
    xTrain = X(tf,:);
    yTrain = Y(tf,:);
    xTest = X(~tf,:);
    yTest = Y(~tf,:);
end