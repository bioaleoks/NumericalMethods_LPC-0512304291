function [Niter, Nval, x, StimaErr] = FPuntoFisso (g, x0, toll, Nmax)
    Niter = 0; StimaErr = 1; Nval = 0;    
    while ((Niter<Nmax)&&(StimaErr>=toll))
        x = g(x0);
        Nval = Nval+1;
        StimaErr = abs(x-x0)/abs(x);
        Niter = Niter +1;
        x0 = x;
    end
    if (StimaErr>=toll)
        disp('Accuratezza non raggiunta!');
    end
end


function [Niter, Nval, x, StimaErr] = FPuntoFisso(g, x0, toll, Nmax)
    % Metodo del punto fisso
    % g     : funzione di iterazione
    % x0    : valore iniziale
    % toll  : tolleranza richiesta
    % Nmax  : numero massimo di iterazioni
    
    Niter = 0;           % contatore iterazioni
    Nval = 0;            % numero valutazioni di g
    StimaErr = Inf;      % inizialmente errore grande
    x = x0;              % inizializzazione soluzione
    
    while (Niter < Nmax) && (StimaErr >= toll)
        x_new = g(x);    % calcolo nuova iterazione
        Nval = Nval + 1; % incremento conteggio valutazioni
        
        % errore assoluto e relativo
        err_ass = abs(x_new - x);
        err_rel = err_ass / (abs(x_new) + eps);
        
        % criterio combinato: prendo il massimo
        StimaErr = max(err_ass, err_rel);
        
        % aggiornamento per iterazione successiva
        x = x_new;
        Niter = Niter + 1;
    end
    
    % messaggio se non ha raggiunto la tolleranza
    if StimaErr >= toll
        disp('Accuratezza non raggiunta!');
    end
end
