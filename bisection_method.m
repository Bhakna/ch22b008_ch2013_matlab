function func_val = bisection_method(func_str)

func = str2func(func_str);

xl = input("Enter xl : "); % lower limit of x
xu = input("Enter xu : "); % upper limit of x
es = input("Enter es : "); % desired error percentage
sign_fig = input("Enter no of significant figures : "); % no of significant figures
xr = 0; % initial guess
ea = 100; % initial error 
iterations = 0; % no of iterations

fprintf('# BISECTION METHOD SOLUTION : \n');

while((ea >= es) && (iterations < 50))

    iterations = iterations + 1;
    x = (xl + xu)/2;
    val = (func(xl))*(func(x));

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

    xr = round(xr, sign_fig, "significant");
    xl = round(xl, sign_fig, "significant");
    xu = round(xu, sign_fig, "significant");
    ea = round(ea, sign_fig, "significant");

    fprintf('Iteration : %d,    x_l : %.9f,    x_u : %.9f,    x_r : %.9f,   error : %.9f \n', iterations, xl, xu, xr, ea);
end

func_val = xr;

end