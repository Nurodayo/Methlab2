function sol = newton_raphson_g2(x0, f, tol, max)
    
    h = 1e-10;

    if nargin < 3 || isempty(tol)
        tol = h;  % si tol es null hacemos que la tolerancia sea el valor mas chiquito distinto de 0 q permite matlab
    end
    if nargin < 4 || isempty(max)
        max = realmax;  % si max es null hacemos iteraciones por el integer mas alto q matlab permite
    end

    % usamos la definicion formal de la derivada para aproximar con 1e-12
    g = f(x0);
    gp = (f(x0+h)-f(x0))/h;
    
    % primera iteracion
    x1 = x0-g/gp;
    i = 0; %% contador

    while abs(x1 - x0) > tol %% si el error es mayor a la tolerancia seguimos
        
        %iteraciones
        x0 = x1;

        g = f(x0);
        gp = (f(x0+h)-f(x0))/h;
        
        %% actualizar x_i+1
        x1 = x0-g/gp;
        
        i = i+1;

        if i == max %% si alcanzamos numero maximo de iteraciones paramos
            break;
        end

    end

    sol = x1;
end

    

