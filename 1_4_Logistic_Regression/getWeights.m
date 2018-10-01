function w = getWeights(X, Y, eta, lambda, maxIter)
    X = [ones(size(X, 1), 1) X];
    w = zeros(size(X, 2), 1);
    wPrev = Inf;
    nIterations = 0;

    while norm(w - wPrev) > 10e-5 && nIterations < maxIter
        wPrev = w;
        w = update(w, X, Y, eta, lambda);
        nIterations = nIterations + 1;
    end
end