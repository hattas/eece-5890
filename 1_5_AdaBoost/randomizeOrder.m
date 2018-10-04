function [X, Y] = randomizeOrder(X, Y)
    order = randperm(length(Y));
    X = X(order, :);
    Y = Y(order);
end