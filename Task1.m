function result = Task1(x0, y0, months, h, M, alpha, gamma, beta, delta)
    %1. := index
    %2. := x
    %3. := y
    result= zeros(3,months+1);
    %result(1,1)=1;
    result(1,1)=0;
    result(2,1)=x0;
    result(3,1)=y0;

    for i=2:months+1

        result(1,i)=i-1;
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
end