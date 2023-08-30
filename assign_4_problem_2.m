nt = 100; % mols

T = 800; % celcius

T = T + 273.15; % kelvin

K(1) = exp( (-17249) / (T + 16.247) );
K(2) = exp( (-39649) / (T + 32.366) );

F = @(x) [K(1) - (( x(1) * (x(1) + 2*x(2)) ) / ( (nt - x(1) - x(2)) * (nt + x(1) + 2*x(2)) ));
         K(2) - (( x(1) * (x(1) + 2*x(2))^2 ) / ( (nt - x(1) - x(2)) * (nt + x(1) + 2*x(2))^2 ))];

initial_value = [0, 0];

opitions = optimoptions('fsolve', 'Display','iter');
solutions = fsolve(F, initial_value, opitions)