function sol = biseccion_g2(a, b, f, tol, max)
%% de la forma que esta programado no importa si los extremos estan desordenados, el programa los reordena
    m = 1e-12;
    i = 0
    if nargin < 4 || isempty(tol)
        tol = m;  % si tol es null hacemos que la tolerancia sea el valor mas chiquito distinto de 0 q permite matlab
    end
    if nargin < 5 || isempty(max)
        max = realmax;  % si max es null hacemos iteraciones por el integer mas alto q matlab permite
    end
    if(a>b)
        b = b+a; %% intercambiamos las variables sin el uso de una variable auxiliar
        a = b-a;
        b = b-a;
    end
    if ((f(a)>0 && f(b)>0) || (f(a)<0 && f(b)<0)) %% Asegurarnos de que los extremos sean validos
        error("Extremos no validos");
    else
        %% primera y segunda iteracion
        %#1
        h = (a+b)/2;
        x0 = h;

        %% hacemos las comparacion de los simbolos + y - y redefinimos extremos
        if f(x0) < 0
            a = h;    
        else
            b = h;
        end
        %#2
        h = (a+b)/2;
        
        x1 = h;
        if f(x1) < 0
            a = h;    
        else
            b = h;
        end

        while abs(x1-x0)>tol
            %% redifinimos la respuesta anterior para el calculo del error
            x0 = x1;
            %% obtenemos los simbolos de los extremos
            if f(x0) < 0
                a = h;    
            else
                b = h;
            end
            h = (a+b)/2;
            x1 = h;
            if i == max
                break; %% paramos si llegamos al numero maximo de iteraciones
            end

        end
    end
    sol = x1;
end

