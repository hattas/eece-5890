function wnew = update(w, X, Y, eta, lambda)
    grad = X' * (Y - sigmoid(X*w)); % 1 - sigmoid(-X*w) = sigmoid(X*w)
    wnew = w + eta * (-lambda * w + grad);  
end