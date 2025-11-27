%Esercitazione 3 - Esercizio 2
a=1;
while a>0
    rmin=a;
    a=a/2;
end
if rmin == realmin
    fprintf('Il valore trovato %e è uguale a realmin\n', rmin);
else
    err_rel=abs(realmin-rmin)/abs(realmin);
    fprintf('Il valore trovato è %e, con un errore relativo pari a %e \n',rmin, err_rel);
end