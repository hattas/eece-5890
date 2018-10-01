function wNew = update(w, X, Y, eta, lambda)
    grad = X' * (Y - sigmoid(X*w)); % 1 - sigmoid(-X*w) = sigmoid(X*w)
    wNew = w + eta * (-lambda * w + grad);  
end