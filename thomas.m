function [x] = thomas(a,d,b,r)
% Input  - a -> vector of elements above the diagonal of A
%        - d -> vector of diagonal elements of A
%        - b -> vector of elements below the diagonal of A
%        - r -> column vector (b in linear system Ax = b)
% Output - x -> solution to the linear system Ax = B

n = 4;
x = zeros(n,1);

a(1) = (a(1))/(d(1));
r(1) = (r(1))/(d(1));

for i = 2:(n-1)
    a(i) = (a(i))/(d(i)-(b(i)*a(i-1)));
    r(i) = (r(i)-(b(i)*r(i-1)))/(d(i)-b(i)*a(i-1));
end

r(n) = (r(n) - b(n)*r(n-1))/(d(n)-b(n)*a(n-1));
x(n) = r(n);
for i=(n-1):-1:1
    x(i) = r(i) - a(i)*x(i+1);
end
end

