x0 = 4000;
y0 = 1000;
months = 60;


result = Task1(x0, y0, months,0.1,10000,0.001, 2, 0.003, 0.001);
result_ca = Task2_3(x0, y0, months, 50, 200, 2, 0.44, 0.99, 0.25);


subplot(1,2,1)
plot(result(1,:), result(2,:), result(1,:), result(3,:));
legend('deer','fox');
grid on;
ylabel('population number');
xlabel('months');
axis([0 months 0 6000]);
subplot(1,2,2)
plot(result_ca(1,:), result_ca(2,:), result_ca(1,:), result_ca(3,:));
legend('deer ca','fox ca');
grid on;
ylabel('population number');
xlabel('months');
axis([0 months 0 6000]);