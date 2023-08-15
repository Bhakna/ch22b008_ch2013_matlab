function func_val = modified_false_position_method(func_str)

func = str2func(func_str);

xl = input("Enter xl : "); % lower limit of x
xu = input("Enter xu : "); % upper limit of x
es = input("Enter es : "); % desired error percentage
sign_fig = input("Enter no of significant figures : "); % no of significant figures

f_xl = func(xl);
f_xu = func(xu);

iu = 0;
il = 0;
xr = 0; % initial guess
ea = 100; % initial error 
iterations = 0; % no of iterations

fprintf('# MODIFIED FALSE POSITION METHOD SOLUTION : \n');

while((ea >= es) && (iterations < 50))

    iterations = iterations + 1;

    x = xu - (f_xu*(xl-xu)/(f_xl-f_xu));
    f_x = func(x);
    val = (f_x)*(f_xu);

    if val < 0

        xl = x;
        f_xl = func(xl);
        il = 0;
        iu = iu + 1;
        if iu>=2 
            f_xu = f_xu/2;
        end
    
    elseif val > 0

        xu = x;
        f_xu = func(xu);
        iu = 0;
        il = il + 1;
        if il>=2
            f_xl = f_xl/2;
        end

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