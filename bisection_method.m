% Root lies between in the interval (x0, x1).
f=input('\n Enter the function f(x): ');
a=input('\n Enter left point of interval: '); 
b=input('\n Enter right point of interval: ');
epsilon=input('\n Enter the error: '); %error of tolerance
%you want. for exmple 0.001 or 0.0001 etc.


if f(a)*f(b)>0 
    disp('Enter valid interval !!!');
else
c = (a + b)/2;
err = abs(a-b);
        
while err > epsilon
    if f(a)*f(c)<0 
       b = c;
    else
      a = c;          
    end
     c = (a + b)/2;
     err = abs(c-b); 
     root=c;
     
     
end
  format long
  disp(root);
end