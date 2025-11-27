epsilon=1;
while 1+epsilon>1
    epsilon = epsilon/2;
end
epsilon=2*epsilon;
if epsilon==eps
    fprintf('Il valore trovato %e è uguale a eps\n', epsilon);
else
    err_rel=abs(eps-epsilon)/abs(eps);
    fprintf('Il valore trovato è %e ma ha un errore relativo pari a %.5f',epsilon, err_rel);
end