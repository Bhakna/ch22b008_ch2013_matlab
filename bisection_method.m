% using bisection method to calculate root of a function

x = linspace(0,2,301);
y = x.*x - 3;
xaxis = 0.*x;

yy = linspace(-3,1,301);
yaxis = 0.*yy;

figure(1)

p = plot(x,y,x,xaxis,yaxis,yy)

p(1).LineWidth = 2;
p(1).Color = "red";
p(1).LineStyle = ':';

p(2).LineWidth = 1.5;
p(2).Color = "black";
p(2).LineStyle = '-';

p(3).LineWidth = 1.5;
p(3).Color = "black";
p(3).LineStyle = '-';

grid on
grid minor


xl = input("Enter xl : ");
xu = input("Enter xu : ");
es = input("Enter es : ");
xr = 2;
ea = 100.0;
count = 0;

while(ea > es)
    count = count + 1;
    x = (xl + xu)/2;
    val = (xl*xl - 3)*(x*x - 3);
    if val < 0
        xu = x;
    elseif val > 0
        xl = x;
    else
        xr = x;
    end
    ea = (x - xr)/x*100;
    ea = abs(ea);
    xr = x;
    fprintf('Iteration : %d,    Value : %.9f,   Error : %.7f \n', count, xr, ea);
end

fprintf('Final Answer : %.9f\n', xr);