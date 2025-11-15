fprintf("Ejercicio 3 \n");

syms x;
%% El programa asume que las funciones son == a 0 a la hora de ejecutar la funcion
%% funcion == 0
f = @(x) (50.41-x.^2).^(-1/2) + (156.25-x.^2).^(-1/2) - (1/2.3);
%%y hay que transformarla antes de pasarsela a la funcion
%%f = matlabFunction(f_sym); % conversion a funcion de matlab

%% ejecutamos las funciones
sol_e3_n = newton_raphson_g2(6.5, f, 0.0001, 256); %% El intervalo [6, 7] es seguro para que la funcion no explote y retorne 
sol_e3_b = biseccion_g2(6, 7, f, 0, 256);
sol_e3_s = secante_g2(7, 6, f, 0.0001, 256);
sol_e3_ne = newton_extendido_g2(6.5, f, 0.0001, 256);

%% imprimimos las Soluciones
fprintf("Respuestas Ejercicio 3 \n\n");
disp(sol_e3_n);
disp(sol_e3_b);
disp(sol_e3_s);
disp(sol_e3_ne);