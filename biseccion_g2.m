function sol = biseccion_g2(a, b, f, tol, max)
%% de la forma que esta programado no importa si los extremos estan desordenados, el programa los reordena
    m = 1e-10;
    i = 0;
    if nargin < 4 || isempty(tol)
        tol = m;  % si tol es null hacemos que la tolerancia sea el valor mas chiquito distinto de 0 q permite matlab
    end
    if nargin < 5 || isempty(max)
        max = realmax-1;  % si max es null hacemos iteraciones por el integer mas alto q matlab permite
    end
    if(a>b)
        [a, b] = deal(b, a);
    end
    %fprintf('f(a) = %.6g, f(b) = %.6g\n', f(a), f(b));
    %fprintf('a = %.6g, b = %.6g\n', a, b);

    if ((f(a)>0 && f(b)>0) || (f(a)<0 && f(b)<0)) %% Asegurarnos de que los extremos sean validos
        error("Extremos no validos");
    else
        %% primera y segunda iteracion
        %#1
        h = (a+b)/2;
        x0 = h;
        %% fprintf('f(a) = %.6g, f(b) = %.6g\n', f(a), f(b));
        fprintf('%.6g BS iteracion %.6g\n',x0, i);
        i = i+1;
        %% hacemos las comparacion de los simbolos + y - y redefinimos extremos
        if f(a)*f(x0) < 0
            b = x0;    
        else
            a = x0;
        end
        %fprintf('f(a) = %.6g, f(b) = %.6g\n', f(a), f(b));

        %#2
        h = (a+b)/2;
        
        x1 = h;
        if f(a)*f(x1) < 0
            b = x1;    
        else
            a = x1;
        end
        %fprintf('f(a) = %.6g, f(b) = %.6g\n', f(a), f(b));
        fprintf('%.6g BS iteracion %.6g\n',x1, i);
        i = i+1;
        while abs(x1-x0)>tol
            %% redifinimos la respuesta anterior para el calculo del error
            x0 = x1;
            %%fprintf('f(a) = %.6g, f(b) = %.6g\n', f(a), f(b));
            h = (a+b)/2;
            x1 = h;  % Actualizacion al punto medio
            if f(a)*f(x1) < 0
                b = h;    
            else
                a = h;
            end
            %% obtenemos los simbolos de los extremos
            fprintf('%.6g BS iteracion %.6g\n',x1, i);

            i = i+1;
            if i>max
                break; %% paramos si llegamos al numero maximo de iteraciones
            end

        end
    end
    fprintf('\n');

    sol = x1;
end

