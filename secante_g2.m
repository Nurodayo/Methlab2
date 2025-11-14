function sol = secante_g2(x0, x1, f, tol, max)
    m = 1e-12;
    i = 0;
    if nargin < 4 || isempty(tol)
        tol = m;  % si tol es null hacemos que la tolerancia sea el valor mas chiquito distinto de 0 q permite matlab
    end
    if nargin < 5 || isempty(max)
        max = realmax;  % si max es null hacemos iteraciones por el integer mas alto q matlab permite
    end
    %% primera iteracion
    x2 = x1-((x1-x0)/(f(x1)-f(x0)))*f(x1);

    while abs(x2-x1) > tol
        %% reemplazamos valores para la sgt iteracion
        x0 = x1;
        x1 = x2;
        x2 = x1-((x1-x0)/(f(x1)-f(x0)))*f(x1);

        i = i + 1;
        if i == max
            break;
        end

    end

    sol = x2;
end