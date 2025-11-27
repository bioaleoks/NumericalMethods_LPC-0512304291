function [x, fx, Niter, Nval, StimaErr, ier] = secanti(f, x0, x1, toll, ftoll, Nmax, a, b)
    f0 = f(x0);
    f1 = f(x1);
    Niter = 0;
    Nval = 2; 
    ier = 0;

    StimaErr = abs(x1 - x0);  

    while ( (StimaErr > toll && StimaErr/(abs(x1) + eps) > toll) ...  
            || abs(f1) > ftoll ) && Niter < Nmax
        
        if f1 == f0
            disp('Errore: Divisione per zero nel metodo delle secanti.');
            ier = -1
            return
        end
        
        x = x1 - f1 * (x1 - x0) / (f1 - f0);
        err_ass = abs(x - x1);
        err_rel = err_ass / (abs(x) + eps);
        StimaErr = max(err_ass, err_rel);
        x0 = x1; 
        f0 = f1;
        x1 = x;
        f1 = f(x);
        Niter = Niter + 1;
        Nval = Nval + 1;
    end
    
    x = x1
    fx = f1
    Niter
    StimaErr = max(err_ass, err_rel)
    x_rif=fzero(f, x0)
    errore= abs(x_rif-x)
     

    if (StimaErr > toll && StimaErr/(abs(x) + eps) > toll) || abs(fx) > ftoll
        disp('Convergenza non raggiunta con sufficiente precisione.');
        ier = -1
    end
    
    if Niter >= Nmax
        disp('Numero massimo di iterazioni raggiunto.');
        ier = -1
    end
    ier=0

    if nargin >= 7 && ~isempty(a) && ~isempty(b) % se il numero di argomenti 
        figure;              % passati è >= 7 e a e b sono dati, fai il grafico
        fplot(f, [a, b])     % sennò nulla
        grid on
        title('Grafico della funzione f(x)')
        xlabel('x')
        ylabel('f(x)')
    end
end
