function H = predictAda(X, h, alpha)
    H = zeros(size(X, 1), 1);
    for t = 1:length(alpha)
        H = H + alpha(t) * h(t).predict(X);
    end
    H = sign(H);
end