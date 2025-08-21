function [s] = jacobi(x0,y0,z0,max)
% Input  - x0  -> initial guess for x 
%        - y0  -> initial guess for y
%        - z0  -> initial guess for z
%        - max -> maximum number of iterations
% Output - s   -> solution to the linear system Ax = B

% initialize initial guesses
x(1) = x0;
y(1) = y0;
z(1) = z0;

% Jacobi's Iteration
for i=2:max
    x(i) = (7+y(i-1)-z(i-1))/4;
    y(i) = (21+4*x(i-1)+z(i-1))/8;
    z(i) = ((15+2*x(i-1)-y(i-1)))/5;
end

% approximation of solution of linear system
s = [x(max),y(max),z(max)];

end