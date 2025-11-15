function sol = newton_extendido_g2(x0, f, tol, max)

    h = 1e-6; %% en newton extendido parece tener problemas con aproximaciones muy exactas

    if nargin < 3 || isempty(tol)
        tol = h;  % si tol es null hacemos que la tolerancia sea el valor mas chiquito distinto de 0 q permite matlab
    end
    if nargin < 4 || isempty(max)
        max = realmax;  % si max es null hacemos iteraciones por el integer mas alto q matlab permite
    end

    % f = matlabFunction(f_sym);
    % usamos la definicion formal de la derivada para aproximar con un
    % numero diminuto h
    
    %% definimos primera y segunda derivada
    fp  = @(x) (f(x+h) - f(x-h)) / (2*h);     
    fpp = @(x) (f(x+h) - 2*f(x) + f(x-h)) / h^2;  

    g = f(x0);
    gp = fp(x0);
    gpp = fpp(x0);
    
    % primera iteracion
    x1 = x0-(g/gp)*(1-((g*gpp)/(2*gp^2)));
    i = 0; %% contador
    fprintf('%.6g NE iteracion %.6g\n',x1, i);

    while abs(x1 - x0) > tol %% si el error es mayor a la tolerancia seguimos
        
        %iteraciones
        x0 = x1;

        g = f(x0);
        gp = fp(x0);
        gpp = fpp(x0);
        
        %% actualizar x_i+1
        x1 = x0-(g/gp)*(1-((g*gpp)/(2*gp^2)));
        
        i = i+1;

        fprintf('%.6g NE iteracion %.6g\n',x1, i);

        if i == max %% si alcanzamos numero maximo de iteraciones paramos
            break;
        end

    end
    fprintf('\n');

    sol = x1;
end

    

