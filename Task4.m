x0 = 4000;
y0 = 1000;
months = 60;
rows = 1;
col = 10000;
rows2 = 100;
col2 = 100;

result_ca = Task2_3(x0, y0, months, rows, col, 2, 0.44, 0.99, 0.25);
result_ca2 = Task2_3(x0, y0, months, rows2, col2,2, 0.44, 0.99, 0.25);

subplot(2,1,1);
plot(result_ca(1,:), result_ca(2,:), result_ca(1,:), result_ca(3,:));
legend('deer','fox');
grid on;
ylabel('population number');
xlabel('months');
axis([0 months 0 6000]);

subplot(2,1,2);
plot(result_ca2(1,:), result_ca2(2,:), result_ca2(1,:), result_ca2(3,:));
legend('deer','fox');
grid on;
ylabel('population number');
xlabel('months');
axis([0 months 0 6000]);