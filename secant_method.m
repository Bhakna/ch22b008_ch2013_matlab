function func_val = secant_method(func_str)

func = str2func(func_str);

x_old2 = input("Enter first guess : ");
x_old = input("Enter second guess : ");
es = input("Enter es : "); % desired error percentage
sign_fig = input("Enter no of significant figures : "); % no of significant figures
ea = 100; % initial error 
iterations = 0; % no of iterations

fprintf('# SECANT METHOD SOLUTION : \n');

while((ea >= es) && (iterations < 50))

    iterations = iterations + 1;

    x = x_old - ((func(x_old))*(x_old2 - x_old)/((func(x_old2))-(func(x_old))));
    
    ea = (x - x_old)/(x)*100 ;
    ea = abs(ea);

    x_old2 = round(x_old2, sign_fig, "significant");
    x_old = round(x_old, sign_fig, "significant");
    x = round(x, sign_fig, "significant");
    ea = round(ea, sign_fig, "significant");

    fprintf('Iteration : %d,    x_old : %.9f,    x : %.9f,    x_new : %.9f,    error : %.9f \n', iterations, x_old2, x_old, x, ea);
    
    x_old2 = x_old;
    x_old = x;
end

func_val = x;

end