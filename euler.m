function [E] = euler(f,a,b,y0,n)
% Input  - f is the function entered as a string  f 
%        - a and b are the left and right endpoints
%        - y0 is the initial condition y(0)
%        - n is the number of steps
% Output - E=[T'  Y'] where T is the vector of abscissas and
%        - Y is the vector of ordinate
format long

h = (b-a)/n;
T = zeros(1,n+1);
Y = zeros(1,n+1);

T = a:h:b;
Y(1) = y0;

for j = 1:n
    Y(j+1) = Y(j) + h*feval(f,T(j),Y(j));
end

E = [T' Y'];

% plot of numerical and true solution
z = (3*exp(T))-T-1;
plot(T,Y,'o',T,z,'*')

title('Numerical Approximation for Differential Equation Using Euler Method')
xlabel('x-axis')
ylabel('y-axis')
legend('Numerical Solution','True Solution')

% Computing Errors
err_1   = norm(Y - z,1); % L1 error
err_2   = norm(Y - z); % L2 error
err_inf = norm(Y - z,Inf); % L infinity error

% Store L1 Error, L2 Error, Maximum Error
fid = fopen('Homework_2_Error_Euler','a');
fprintf(fid, 'h=%f             \n', h); 
fprintf(fid, 'err_1=%14.8e     \n', err_1); 
fprintf(fid, 'err_2=%14.8e     \n', err_2); 
fprintf(fid, 'err_inf=%14.8e   \n', err_inf); 
fclose(fid);

end