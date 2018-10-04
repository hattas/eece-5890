function epsilon = classificationError(Y, Yhat, D)
    epsilon = dot(D, Yhat ~= Y);
end