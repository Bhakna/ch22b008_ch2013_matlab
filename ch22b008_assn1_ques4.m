% this is the 4th question of the 1st assignment

x = linspace(0, pi, 11);
y = cos(x);
z = exp(-1*x);

figure(1)
plot(x, y, LineWidth=1.5, Color="green", LineStyle="-", Marker="+")

hold on
plot(x, z, LineWidth=1.5, Color="cyan", LineStyle=":", Marker="+")
hold off

legend("cos(x)","exp(-x)")
grid on

figure(2)

subplot(2,1,1)
plot(x, y, LineWidth=1, Color="red", LineStyle="--")
title("graph of cos(x) vs x")
grid on

subplot(2,1,2)
plot(x, z, LineWidth=1, Color="blue", LineStyle="-.")
title("graph of exp(-x) vs x")
grid on

figure(3)

semilogx(x, z, LineWidth=1.5, Color="red", LineStyle="-")
title("semilogx of exp(-x) vs x")
grid on



