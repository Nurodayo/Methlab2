syms x;
%% El programa asume que las funciones son == a 0 a la hora de ejecutar la funcion
%% funcion == 0
f_sym = (50.41-x^2)^(-1/2)+(156.25-x^2)^(-1/2)-(1/2.3); %%esto es una funcion simbolica
%% usamos sind y cosd debido a que el ejercicio esta en grados
%%y hay que transformarla antes de pasarsela a la funcion
f = matlabFunction(f_sym); % conversion a funcion de matlab
%% solucion inicial
x0 = 5;

%% ejecutamos las funciones
sol_e2_n = newton_raphson_g2(x0, f, 0.0001, 256);
sol_e2_b = biseccion_g2(6, 8, f, 0, 256);
sol_e2_s = secante_g2(9, 5, f, 0.0001, 256);

%% imprimimos las Soluciones
fprintf("Respuestas Ejercicio 2 \n\n");
disp(sol_e2_n);
disp(sol_e2_b);
disp(sol_e2_s)