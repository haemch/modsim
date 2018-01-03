% duration
months = 120;
% schrittweite der diskretisierung? 
h = 0.1; 
% resource capacity
M = 10000;


% deer growth
alpha = 0.001;
% fox decreasing 
gamma = 2;
% deer reduction
beta = 0.003;
% fresh meat increase
delta = 0.001;

% deer
x0 = 4000;
% fox
y0 = 1000; 

%1. := index
%2. := x
%3. := y
result= zeros(3,months);
result(1,1)=1;
result(2,1)=x0;
result(3,1)=y0;

for i=2:months
    
    result(1,i)=i;
    %xn-1
    x = result(2,i-1);
    %yn-1
    y = result(3,i-1);
    
    %difference equation for x
    x_new = x + h * (x * alpha * (M - x - y) - x * y * beta);
    x_new = round(x_new);
    %difference equation for y
    y_new = y + h * (y * (delta * x - gamma));
    y_new = round(y_new);
        
    result(2,i)= x_new;
    result(3,i)= y_new;
    
end
plot(result(1,:), result(2,:), result(1,:), result(3,:));
legend('deer','fox')

