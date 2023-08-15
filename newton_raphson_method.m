function func_val = newton_raphson_method(func_str)

func = str2func(func_str);

func_initializor = "@(x)";
func_main_function = input("Enter derivative of func : ","s");
func_derivative = str2func(strcat(func_initializor,func_main_function));

x = input("Enter initial guess : "); % guess value of x
es = input("Enter es : "); % desired error percentage
sign_fig = input("Enter no of significant figures : "); % no of significant figures
m = input("Enter m : ");
ea = 100; % initial error 
iterations = 0; % no of iterations

fprintf('# NEWTON RAPHSON METHOD SOLUTION : \n');

while((ea >= es) && (iterations < 50))

    iterations = iterations + 1;
    
    ea_old = ea;
    x_old = x;
    x = x_old - (m*(func(x_old))/(func_derivative(x_old)));
    
    ea = (x - x_old)/(x)*100 ;
    ea = abs(ea);

    ea_r = ea/ea_old ;

    x_old = round(x_old, sign_fig, "significant");
    x = round(x, sign_fig, "significant");
    f_x_old = round(func(x_old), sign_fig, "significant");
    f_x_deriv = round(func_derivative(x_old), sign_fig, "significant");
    ea = round(ea, sign_fig, "significant");
    ea_r = round(ea_r, sign_fig, "significant");

    fprintf('Iteration : %d,    x : %.9f,    f_x : %.9f,    f_x_der : %.9f,    x_new : %.9f,    error : %.9f,    ea_r : %.9f \n', iterations, x_old, f_x_old, f_x_deriv, x, ea, ea_r);
end

func_val = x;

end