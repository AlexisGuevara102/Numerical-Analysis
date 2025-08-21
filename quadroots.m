function [r1,r2] = quadroots(a,b,c)
format long

D = b^2 - (4*a*c);

if (D < 0)
    error('The discriminant is negative. There is no real roots')
end

% calculate r1
r1 = (-b + sqrt(D)) / (2*a);

% calculate r2
r2 = (-b - sqrt(D)) / (2*a);

end