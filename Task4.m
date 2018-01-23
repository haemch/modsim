x0 = 4000;
y0 = 1000;
months = 120;

result_ca = Task2_3(x0, y0, months, 70, 200, 1, 0.01, 0.99, 0.01);

figure(1);
plot(result_ca(1,:), result_ca(2,:), result_ca(1,:), result_ca(3,:));
legend('deer','fox');
grid on;
ylabel('population number');
xlabel('months');
axis([0 120 0 6000]);