% ASSIGNMENT-4 PROBLEM-1

%
% VARIABLE DECLARATION
%

T = 200; % immediate temperature in celcius
T = T + 273.15; % convert to kelvin
P = 10; % immediate pressure in bar

Tc = 126.2; % critical temperature in kelvin
Pc = 34; % critical pressure in bar

R = 8.314472 * (10^(-5)); % ideal gas const in [ m3 bar kelvin-1 mol-1 ]

error_limit = 10^(-6) % tolerence is set to 10^(-6)
iter_limit = 500; % max iterations allowed
sign_fig = 4; % significant-figure

V0 = 0.005; % initial guess for molar volume in [ m3 mol-1 ]

syms V; % declaring V as math symbolic expression

%
% VANDER-WAAL EQUATION
%

a = (27 * R^2 * Tc^2) / (64 * Pc); % value of const a
b = (R * Tc) / (8 * Pc); % value of const b

% equations for newton-raphson method
vander_waal = P - ( (R * T) / (V - b) ) + ( (a) / (V^2) ); % f(x)
vander_waal_diff = diff(vander_waal); % f'(x)

% equation for using fsolve
vander_waal_fsolve = @(x) P - ( (R * T) / (x - b) ) + ( (a) / (x^2) ); % x is molar volume

x = V0; % initial guess for newton-raphson
error = 1; % initial guess error
ea = 100; % initial guess relative error
iterations_van = 0; % iteration count

ea_van = []; % iterations of newton-raphson

while( (error > error_limit) & (iterations_van < iter_limit) )

    iterations_van = iterations_van + 1;
    
    x_old = x;
    f_x = vpa(subs(vander_waal,V,x_old));
    f_dash_x = vpa(subs(vander_waal_diff,V,x_old));
    x = x_old - (f_x/f_dash_x) ;

    error = (x - x_old);
    error = abs(error);

    ea = (x - x_old)/x*100;
    ea = abs(ea);
    ea = round(ea,sign_fig,"significant");
    ea_van = [ea_van, ea];
    
end

ans_van_nr = x;
options = optimoptions('fsolve','FunctionTolerance', error_limit);
[ans_van_fs, fval, exitflag, output_van] = fsolve(vander_waal_fsolve, V0, options);


%
% REDLICH-KWONG EQUATION
%

a = (0.4278 * R^2 * Tc^2) / (Pc); % value of const a
b = (0.0867 * R * Tc) / (Pc); % value of const b

% equations for newton-raphson method
redlich_kwong = P - ( (R * T) / (V - b) ) + ( (a) / ( (V) * (V - b) * (T^(0.5)) ) ); % f(x)
redlich_kwong_diff = diff(vander_waal); % f'(x)

% equation for using fsolve
redlich_kwong_fsolve = @(x) P - ( (R * T) / (x - b) ) + ( (a) / ( (x) * (x - b) * (T^(0.5)) ) );

x = V0; % initial guess for newton-raphson
error = 1; % initial guess error
ea = 100; % initial guess relative error
iterations_red = 0; % iteration count

ea_red = []; % iterations of newton-raphson

while( (error > error_limit) & (iterations_red < iter_limit) )

    iterations_red = iterations_red + 1;
    
    x_old = x;
    f_x = vpa(subs(redlich_kwong,V,x_old));
    f_dash_x = vpa(subs(redlich_kwong_diff,V,x_old));
    x = x_old - (f_x/f_dash_x) ;

    error = (x - x_old);
    error = abs(error);
    
    ea = (x - x_old)/x*100;
    ea = abs(ea);
    ea = round(ea,sign_fig,"significant");
    ea_red = [ea_red, ea];
    
end

ans_red_nr = x;
options = optimoptions('fsolve','FunctionTolerance', error_limit);
[ans_red_fs, fval, exitflag, output_red] = fsolve(redlich_kwong_fsolve, V0, options);


%
% FINAL SOLUTION
%

clc

ans_van_nr = round(ans_van_nr,sign_fig,"significant");
ans_van_fs = round(ans_van_fs,sign_fig,"significant");
ans_red_nr = round(ans_red_nr,sign_fig,"significant");
ans_red_fs = round(ans_red_fs,sign_fig,"significant");

fprintf('VANDER-WAAL METHOD: \n\n');
fprintf('Molar Volume using newton-raphson : %.8f \n', ans_van_nr);
fprintf('No of iterations : %d \n\n', iterations_van);
fprintf('Molar Volume using fsolve method : %.8f \n', ans_van_fs);
fprintf('No of iterations : %d \n\n', output_van.iterations);
fprintf('\n');
fprintf('REDLICH-KWONG METHOD: \n\n');
fprintf('Molar Volume using newton-raphson : %.8f \n', ans_red_nr);
fprintf('No of iterations : %d \n\n', iterations_red);
fprintf('Molar Volume using fsolve method : %.8f \n', ans_red_fs);
fprintf('No of iterations : %d \n\n', output_red.iterations);

figure(1)

x_1 = [1:1:iterations_van];
x_2 = [1:1:iterations_red];

plot(x_1, ea_van, 'r')
hold on
plot(x_2, ea_red, 'b')
hold off

legend('vander waal ea','redlich kwong ea');
grid on
grid minor
