x0 = 4000;
y0 = 1000;
months = 120;


result = Task1(x0, y0, months,0.1,10000,0.001, 2, 0.003, 0.001);
result_ca = Task2_3(x0, y0, months, 70, 200, 1, 0.01, 0.99, 0.01);

figure(1);
plot(result(1,:), result(2,:), result(1,:), result(3,:),result_ca(1,:), result_ca(2,:), result_ca(1,:), result_ca(3,:));
legend('deer','fox','deer_ca','fox-ca');
grid on;
ylabel('population number');
xlabel('months');
axis([0 120 0 6000]);