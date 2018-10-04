function [h, alpha] = trainAdaBoost(X, Y, nIterations, print)
    if nargin < 4, print = false; end
    n = size(X, 1);
    h = DecisionStump.empty(nIterations, 0);
    alpha = zeros(nIterations, 1);
    D = ones(n, 1) / n; % importance vector starts as all equal
    
    for t = 1:nIterations
        h(t) = DecisionStump();
        
        h(t) = h(t).fit(X, Y, D);
        Yhat = h(t).predict(X);
        
        epsilon = classificationError(Y, Yhat, D);
        alpha(t) = 1/2 * log((1 - epsilon) / epsilon);
        
        D = D .* exp(-alpha(t) * Y .* Yhat);
        D = D / sum(D);
        
        if print
            fprintf('t=%-2d\tj=%d\tc=%.1f\tC1=%+d\n',t,h(t).j,h(t).c,h(t).C1)
        end
    end
end