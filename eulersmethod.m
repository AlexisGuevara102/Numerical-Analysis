% Euler's Method
% Initial conditions and setup
h = 0.5;  % step size
x = 0:h:1;  % the range of x
y = zeros(size(x));  % allocate the result y
y(0) = 2;  % the initial y value
n = numel(y);  % the number of y values

% The loop to solve the DE
for i=1:n-1
    f = x+y;
    y(i+1) = y(i) + h * f;
end

plot(x,y); grid on