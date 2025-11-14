syms x;
%% El programa asume que las funciones son == a 0 a la hora de ejecutar la funcion
%% funcion == 0
f_sym = 0.4508*sind(x)*cosd(x)+2.2156*sind(x)^2-0.2454*cosd(x)-1.2060*sind(x); %%esto es una funcion simbolica
%% usamos sind y cosd debido a que el ejercicio esta en grados
%%y hay que transformarla antes de pasarsela a la funcion
f = matlabFunction(f_sym); % conversion a funcion de matlab
%% solucion inicial
x0 = 45;

%% ejecutamos las funciones
sol_e1_n = newton_raphson_g2(x0, f, 0.0001, 256);
sol_e1_b = biseccion_g2(90, 0, f, 0.0001, 256);

%% imprimimos las Soluciones
disp(sol_e1_n);
disp(sol_e1_b)