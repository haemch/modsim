x0 = 40;
y0 = 10;
months = 120;
rows = 2;
col = 50;
rows2 = 10;
col2 = 10;

result_ca = Task2_3(x0, y0, months, rows, col, 2, 0.44, 0.99, 0.25);
result_ca2 = Task2_3(x0, y0, months, rows, col,2, 0.44, 0.99, 0.25);

subplot(1,2,1)
plot(result_ca(1,:), result_ca(2,:), result_ca(1,:), result_ca(3,:));
legend('deer','fox');
grid on;
ylabel('population number');
xlabel('months');
axis([0 120 0 6000]);

subplot(1,2,2)
plot(result_ca2(1,:), result_ca2(2,:), result_ca2(1,:), result_ca2(3,:));
legend('deer','fox');
grid on;
ylabel('population number');
xlabel('months');
axis([0 120 0 6000]);