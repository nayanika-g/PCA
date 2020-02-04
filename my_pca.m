function Y = my_pca(A)
x = A(:,1);
y = A(:,2);
x = x-ones(10,1)*mean(x);
y = y-ones(10,1)*mean(y);
% m = [mean(x),mean(y)];
m = mean(A);
X = [x y];
Cx = cov(X);
[eigvec, eigval] = eig(Cx);
D = diag(eigval);
P = eigvec(:, find(D == max(D)));
Y = P' * X';
%Cy = cov(Y);
r = (P*Y + m')' %reconstructed
end