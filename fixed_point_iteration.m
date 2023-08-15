function func_val = fixed_point_iteration(func_str)

func = str2func(func_str);

x = input("Enter initial guess : "); % guess value of x
es = input("Enter es : "); % desired error percentage
sign_fig = input("Enter no of significant figures : "); % no of significant figures
ea = 100; % initial error 
iterations = 0; % no of iterations

fprintf('# FIXED POINT ITERATION SOLUTION : \n');

while((ea >= es) && (iterations < 50))

    iterations = iterations + 1;

    x_old = x;
    x = func(x_old);
    
    ea = (x - x_old)/(x)*100 ;
    ea = abs(ea);

    x_old = round(x_old, sign_fig, "significant");
    x = round(x, sign_fig, "significant");
    ea = round(ea, sign_fig, "significant");

    fprintf('Iteration : %d,    x : %.9f,    x_new : %.9f,    error : %.9f \n', iterations, x_old, x, ea);
end

func_val = x;

end