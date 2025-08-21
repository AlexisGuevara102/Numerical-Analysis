function [H] = heun(f,a,b,y0,n)
% Input  - f is the function entered as a string  f 
%        - a and b are the left and right endpoints
%        - y0 is the initial condition y(0)
%        - n is the number of steps
% Output - H=[T'  Y'] where T & Y are vectors
format long

h = (b-a)/n;
T = zeros(1,n+1);
Y = zeros(1,n+1);

T = a:h:b;
Y(1) = y0;

for j = 1:n
    k1 = feval(f,T(j),Y(j));
    k2 = feval(f,T(j+1),Y(j)+h*k1);
    Y(j+1) = Y(j) + (h/2)*(k1+k2);
end

H = [T' Y'];

% plot of numerical and true solution
z = 3*exp(-T/2)-2+T;
plot(T,Y,'o',T,z,'*')

title('Numerical Approximation for Differential Equation Using Heun Method')
xlabel('x-axis')
ylabel('y-axis')
legend('Numerical Solution','True Solution')

% Computing Errors
err_1   = norm(Y - z,1); % L1 error
err_2   = norm(Y - z); % L2 error
err_inf = abs(max(Y - z)); % L infinity error

% Store L1 Error, L2 Error, Maximum Error
fid = fopen('Homework_2_Error_Heun','a');
fprintf(fid, 'h=%f       \n', h); 
fprintf(fid, 'err_1=%14.8e     \n', err_1); 
fprintf(fid, 'err_2=%14.8e     \n', err_2); 
fprintf(fid, 'err_inf=%14.8e   \n', err_inf); 
fclose(fid);

end

