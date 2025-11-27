function [x, fx, StimaErr, Niter, Nval, ier] = newton(f, df, x0, toll, ftoll, maxIter)
    fx=f(x0);
    dfx=df(x0);
    Niter=0;
    Nval=2; 
    ier=0;
    StimaErr=inf;
    
    while (StimaErr > toll || abs(fx) > ftoll) && Niter < maxIter
        if dfx == 0
            disp('Errore: derivata nulla. Impossibile proseguire.');
            ier = -2
            break
        end
        x = x0 - fx / dfx;

        % Errore relativo (più stabile di quello assoluto)
        if abs(x) > eps
            StimaErr = abs(x - x0) / abs(x);
        else
            StimaErr = abs(x - x0); % fallback se x è molto piccola
        end
        x0 = x;
        fx = f(x0);
        dfx = df(x0);
        Niter = Niter + 1;
        Nval = Nval + 2; % ogni passo valuta f e df
    end
  
    x = x0
    fx
    x_rif=fzero(f, x)
    errore= abs(x_rif-x)
    StimaErr
    Niter
    Nval
    
    if (StimaErr > toll || abs(fx) > ftoll)
        disp('Convergenza non raggiunta con sufficiente precisione.');
        ier = -1
    elseif Niter >= maxIter
        disp('Numero massimo di iterazioni raggiunto.');
        ier = -1
    end
    ier
end
