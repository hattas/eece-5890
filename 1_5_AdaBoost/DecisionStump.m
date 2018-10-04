classdef DecisionStump
    properties
        C1, C2 % {-1,1} class assignments
        c  % threshold
        j  % feature index
    end
    methods
        function obj = DecisionStump()
            obj.C1 = 1;
            obj.C2 = -1;
            obj.c = 0;
            obj.j = 1;
        end
        
        function obj = fit(obj, X, Y, D)
            minError = Inf;
            for j = 1:size(X, 2)
                % find candidates for threshold splits
                Xj = X(:, j);
                sortedXj = sort(X(:, j));
                thresholds = (sortedXj(1:end - 1) + sortedXj(2:end)) / 2;
                for c = thresholds'
                    for C1 = [-1, 1]
                        C2 = -1 * C1;
                        Yhat = C1 * (Xj >= c) + C2 * (Xj < c);
                        error = classificationError(Y, Yhat, D);
                        if error < minError
                            minError = error;
                            obj.C1 = C1;
                            obj.C2 = C2;
                            obj.c = c;
                            obj.j = j;
                        end
                    end
                end
            end
        end
        
        function Yhat = predict(obj, X)
            Xj = X(:, obj.j);
            Yhat = obj.C1 * (Xj >= obj.c) + obj.C2 * (Xj < obj.c);
        end
    end
end