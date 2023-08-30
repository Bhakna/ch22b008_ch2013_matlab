T = 200 + 273.15; % kelvin
P = 10; % bar
Tc = 126.2; % kelvin
Pc = 34; % bar
R = 8.314472 * (10^(-5)); % m3 bar kelvin-1 mol-1
error_limit = 0.0001;
V0 = 0.005;

a = (27 * R^2 * Tc^2) / (64 * Pc);
b = (R * Tc) / (8 * Pc);

syms V

vander_waal = P - ( (R * T) / (V - b) ) + ( (a) / (V^2) );
vander_waal_fsolve = @(x) P - ( (R * T) / (x - b) ) + ( (a) / (x^2) );
vander_waal_diff = diff(vander_waal);

x = V0;
error = 1;
iterations = 0;
arr_iter = [];
arr_iter_2 = [];

while( (error > error_limit) & (iterations < 100) )

    iterations = iterations + 1;
    
    x_old = x;
    f_x = vpa(subs(vander_waal,V,x_old));
    f_x_2 = vpa(subs(vander_waal_diff,V,x_old));
    x = x_old - (f_x/f_x_2) ;

    error = (x - x_old);
    error = abs(error);
    arr_iter = [arr_iter, x];
    
end

ans_nr_1 = x;
options = optimoptions('fsolve','FunctionTolerance', error_limit);
ans_fsolve_1 = fsolve(vander_waal_fsolve, V0, options);



a = (0.4278 * R^2 * Tc^2) / (Pc);
b = (0.0867 * R * Tc) / (Pc);

vander_waal = P - ( (R * T) / (V - b) ) + ( (a) / ( (V) * (V - b) * (T^(0.5)) ) );
vander_waal_fsolve = @(x) P - ( (R * T) / (x - b) ) + ( (a) / ( (x) * (x - b) * (T^(0.5)) ) );
vander_waal_diff = diff(vander_waal);

x = V0;
error = 1;
iterations = 0;

while( (error > error_limit) & (iterations < 100) )

    iterations = iterations + 1;
    
    x_old = x;
    f_x = vpa(subs(vander_waal,V,x_old));
    f_x_2 = vpa(subs(vander_waal_diff,V,x_old));
    x = x_old - (f_x/f_x_2) ;

    error = (x - x_old);
    error = abs(error);
    arr_iter_2 = [arr_iter_2, x];
    
end

ans_nr_2 = x;
ans_fsolve_2 = fsolve(vander_waal_fsolve, V0, options);

clc

round(ans_nr_1,4,"significant")
round(ans_fsolve_1,4,"significant")
round(ans_nr_2,4,"significant")
round(ans_fsolve_2,4,"significant")
