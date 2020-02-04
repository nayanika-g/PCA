function Y = my_pca(A)
x = A(:,1);
y = A(:,2);
%Center the data
x = x-ones(10,1)*mean(x);
y = y-ones(10,1)*mean(y);
% m = [mean(x),mean(y)];
m = mean(A);
X = [x y];
%Calculate the covariance matrix.
Cx = cov(X);
[eigvec, eigval] = eig(Cx);
D = diag(eigval);
%Find P, the eigenvector with the dominant eigenvalue.
P = eigvec(:, find(D == max(D)));
%Compute Y
Y = P' * X';
%Cy = cov(Y);
%Reconstruct from the transformed data.
r = (P*Y + m')' %reconstructed
end
