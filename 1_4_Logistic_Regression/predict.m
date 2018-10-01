function p = predict(w, X)
    p = sigmoid(X*w) >= 0.5;
end