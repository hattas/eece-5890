load('digits.mat')
Xbar = mean(X);
Xc = X - Xbar;
sigma = cov(Xc);
[V,D] = eig(sigma);
V = fliplr(V); % sort descending

%% Part 1: Plot the first 9 principal components as images
figure(1)
for i=1:9
    subplot(3,3,i)
    plotDigit(V(:,i));
    title(['PC' num2str(i)]);
end

%% Part 2: Plot the eigenvalues in decreasing order
figure(2)
eigs = flipud(diag(D));
plot(eigs,'r','linewidth',1.5)
title('Eigenvalues')

%% Part 3: Image reconstruction
num_components = [1, 2, 5, 10, 21, 44, 94, 200, 784];
for i=1:2
    figure(2+i)
    for j=1:9
        n = num_components(j);
        V_n = V(:,1:n);
        z = Xc(i,:)*V_n;
        xhat = Xbar + z*V_n';
        subplot(3,3,j)
        plotDigit(xhat);
        title([num2str(n) ' PC''s']);
    end
end

