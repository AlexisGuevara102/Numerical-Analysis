function [lambda,info] = QRMethod(a,b,TOL,M)
% INPUT:  a      - Column Vector of Diagonal Elements of Matrix A
%         b      - Column Vector of First Upper Diagonal Elements 
%                    and First Lower Diagonal Elements of Matrix A
%         TOL    - Tolerance
%         M      - Number of Iterations
% OUTPUT: lambda - n-Dimensional Column Vector Storing all Eigenvalues
%                    obtained
%         info   - = 0 if all eigenvalues are obtained
%                  = 1 if recommended splitting of A
%                  = 2 if the maximum number of iterations is exceeded

format long

% Initialize Variables
n = length(a);
lambda = zeros(n,1);
info = 0;

for I = 1:M
    % QR Factorization
    [Q,R] = qr( diag(a) + diag(b,1) + diag(b,-1) );

    % Update Eigenvalues
    A_new = R * Q;
    lambda_new = eig(A_new);

    % Check Convergence
    if norm(lambda - lambda_new, inf) < TOL
        lambda = lambda_new;
        info = 0; % All Eigenvalues Obtained
        break;
    end

    % Recommended Splitting of A
    if I == M && abs(A_new(n,n-1)) > TOL
        info = 1;
        break;
    end

    lambda = lambda_new;
end

% Check if Max Number of Iterations is Exceeded
if I == M && info ~= 1
    info = 2;
end

disp('Eigenvalues:');
disp(lambda);
disp(['Info: ',num2str(info)]);

end