function my_func = graph_plotter()

func_initializor = "@(x)";
func_main_function = input("Enter function in x : ","s");
func = str2func(strcat(func_initializor,func_main_function));

x_range_lower = input("Enter range of x (lower) : ");
x_range_higher = input("Enter range of x (higher) : ");
no_of_points = 501;

x_range_lower = min(0,x_range_lower);
x_range_higher = max(0,x_range_higher);

func_x = linspace(x_range_lower,x_range_higher,no_of_points);
func_y = func(func_x);
func_y2 = func_x;

xaxis_y = 0.*func_x;

y_range_lower = min([0,min(func_y),min(func_y2)]);
y_range_higher = max([0,max(func_y),max(func_y2)]);

yaxis_y = linspace(y_range_lower,y_range_higher,no_of_points);
yaxis_x = 0.*yaxis_y;

figure

p = plot(func_x,func_y,func_x,xaxis_y,yaxis_x,yaxis_y,func_x,func_y2)

p(1).LineWidth = 2;
p(1).Color = "red";
p(1).LineStyle = ':';

p(2).LineWidth = 1.5;
p(2).Color = "black";
p(2).LineStyle = '-';

p(3).LineWidth = 1.5;
p(3).Color = "black";
p(3).LineStyle = '-';

p(4).LineWidth = 2;
p(4).Color = "green";
p(4).LineStyle = ':';

grid on
grid minor

my_func = strcat(func_initializor,func_main_function);

end