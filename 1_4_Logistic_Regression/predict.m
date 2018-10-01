function p = predict(w, X)
    X = [ones(size(X, 1), 1) X];
    p = sigmoid(X*w) >= 0.5;
end