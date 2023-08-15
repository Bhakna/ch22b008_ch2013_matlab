% function root calculator

my_func = graph_plotter();

value = newton_raphson_method(my_func);
fprintf('\nFinal Answer : %.9f\n', value);